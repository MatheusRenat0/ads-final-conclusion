# Minhas anotações: Minimal APIs, roteamento e validação

## Objetivos

- Criar endpoints HTTP com Minimal APIs.
- Receber dados da rota, da query string e do corpo.
- Retornar resultados tipados e validar entradas.

## Conteúdo

**Minimal APIs** definem endpoints diretamente no `Program.cs`, com menos cerimônia que controllers.

### Rotas e métodos

```csharp
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

var tarefas = new List<Tarefa>();
var proximoId = 1;

app.MapGet("/tarefas", () => tarefas);

app.MapGet("/tarefas/{id:int}", (int id) =>
    tarefas.FirstOrDefault(t => t.Id == id) is { } t
        ? Results.Ok(t)
        : Results.NotFound());

app.MapPost("/tarefas", (NovaTarefa dados) =>
{
    var tarefa = new Tarefa(proximoId++, dados.Titulo, false);
    tarefas.Add(tarefa);
    return Results.Created($"/tarefas/{tarefa.Id}", tarefa);
});

app.MapDelete("/tarefas/{id:int}", (int id) =>
    tarefas.RemoveAll(t => t.Id == id) > 0 ? Results.NoContent() : Results.NotFound());

app.Run();

record Tarefa(int Id, string Titulo, bool Concluida);
record NovaTarefa(string Titulo);
```

(Para um exemplo completo e testável, mantenha o estado em um serviço, e não em variáveis do `Program.cs`, que não são seguras para acesso concorrente; veja a aula 04 com banco de dados.)

### Origem dos parâmetros

| Origem | Exemplo |
|---|---|
| Rota | `/tarefas/{id:int}` → `int id` |
| Query string | `/tarefas?pagina=2` → `int pagina = 1` |
| Corpo (JSON) | `NovaTarefa dados` (inferido em POST/PUT) |
| Cabeçalho | `[FromHeader] string x` |
| Serviço (DI) | `IRelogio relogio` |

```csharp
app.MapGet("/busca", (string? termo, int pagina = 1, int tamanho = 10) =>
    Results.Ok(new { termo, pagina, tamanho }));
```

### Resultados tipados

`Results.*` e `TypedResults.*` padronizam códigos HTTP. Com `TypedResults` os tipos de resposta ficam explícitos (melhor para OpenAPI e testes).

```csharp
app.MapGet("/tarefas/{id:int}", Results<Ok<Tarefa>, NotFound> (int id) =>
    tarefas.FirstOrDefault(t => t.Id == id) is { } t
        ? TypedResults.Ok(t)
        : TypedResults.NotFound());
```

(Requer `using Microsoft.AspNetCore.Http.HttpResults;`.)

### Grupos de rotas

```csharp
var api = app.MapGroup("/api/v1/tarefas").WithTags("Tarefas");
api.MapGet("/", () => tarefas);
api.MapPost("/", (NovaTarefa d) => TypedResults.Created("/api/v1/tarefas/1", d));
```

### Validação

Desde o .NET 10, as Minimal APIs têm suporte nativo a validação com *Data Annotations*:

```csharp
using System.ComponentModel.DataAnnotations;

builder.Services.AddValidation();

app.MapPost("/tarefas", (NovaTarefa dados) => TypedResults.Ok(dados));

record NovaTarefa(
    [property: Required, StringLength(100, MinimumLength = 3)] string Titulo);
```

Entradas inválidas resultam em `400 Bad Request` com `ProblemDetails`. Em versões anteriores, valide manualmente (ou com bibliotecas) e devolva `Results.ValidationProblem(...)`:

```csharp
app.MapPost("/manual", (NovaTarefa d) =>
{
    var erros = new Dictionary<string, string[]>();
    if (string.IsNullOrWhiteSpace(d.Titulo) || d.Titulo.Length < 3)
        erros["titulo"] = ["O título deve ter ao menos 3 caracteres."];
    return erros.Count > 0 ? Results.ValidationProblem(erros) : Results.Ok(d);
});
```

### Tratamento global de erros

```csharp
builder.Services.AddProblemDetails();
app.UseExceptionHandler();      // respostas de erro no formato RFC 9457 (Problem Details)
app.UseStatusCodePages();
```

### Documentação OpenAPI

```csharp
builder.Services.AddOpenApi();
// ...
if (app.Environment.IsDevelopment())
    app.MapOpenApi();           // documento em /openapi/v1.json
```

Use ferramentas como Scalar ou Swagger UI (pacotes opcionais) para uma interface visual; o modelo web padrão do .NET 9+ já não inclui Swagger UI.

### Testar a API

Arquivo `.http` (VS Code com REST Client / Visual Studio):

```http
@host = http://localhost:5000

POST {{host}}/tarefas
Content-Type: application/json

{ "titulo": "Estudar minimal APIs" }

###
GET {{host}}/tarefas
```

## Exercícios

1. Que código HTTP devolver ao criar um recurso?
2. Como receber `?pagina=2` com valor padrão 1?
3. Qual a vantagem de `TypedResults`?
4. Por que não manter listas estáticas como "banco" em produção?

## Respostas comentadas

1. `201 Created`, com o cabeçalho `Location` do novo recurso.
2. Parâmetro `int pagina = 1` no delegate do endpoint.
3. Os tipos de retorno ficam explícitos, gerando documentação OpenAPI precisa e facilitando testes.
4. Os dados se perdem ao reiniciar e há problemas de concorrência e de escala.

## Desafio

Implemente CRUD de "Livros" (id, título, autor, ano) com `MapGroup`, `TypedResults`, validação (título obrigatório, ano entre 1000 e o ano atual) e arquivo `.http` com os cenários de sucesso e erro.

## Referências

- [Minimal APIs — visão geral](https://learn.microsoft.com/aspnet/core/fundamentals/minimal-apis/overview)
- [Validação em Minimal APIs](https://learn.microsoft.com/aspnet/core/fundamentals/minimal-apis/include-metadata)
- [Gerar documentos OpenAPI](https://learn.microsoft.com/aspnet/core/fundamentals/openapi/overview)
- [Problem Details — RFC 9457](https://datatracker.ietf.org/doc/html/rfc9457)
