# Minhas anotações: Web API REST com ASP.NET Core

## Objetivos

- Aplicar princípios REST e boas práticas de design de API.
- Criar controllers de API com DTOs, paginação e tratamento de erros.
- Documentar a API com OpenAPI e consumir com `HttpClient`.

## Conteúdo

### Princípios REST

- Recursos identificados por URLs no plural: `/livros`, `/livros/10`.
- Verbos HTTP com semântica: GET (ler), POST (criar), PUT (substituir), PATCH (alterar parcialmente), DELETE (remover).
- Respostas com códigos adequados: 200, 201, 204, 400, 401, 403, 404, 409, 422, 500.
- Sem estado no servidor (cada requisição traz o necessário).
- Representações em JSON.

| Ação | Requisição | Resposta |
|---|---|---|
| Listar | `GET /api/livros?pagina=1` | `200` + lista |
| Detalhar | `GET /api/livros/10` | `200` ou `404` |
| Criar | `POST /api/livros` | `201` + `Location` |
| Atualizar | `PUT /api/livros/10` | `204` ou `404` |
| Excluir | `DELETE /api/livros/10` | `204` ou `404` |

### DTOs

Nunca exponha entidades do banco diretamente: use **DTOs** (objetos de transferência) para definir o contrato da API e evitar *overposting* (cliente enviando campos que não deveria controlar).

```csharp
public record LivroDto(int Id, string Titulo, string Autor, int Ano);

public record CriarLivroDto(
    [property: Required, StringLength(150, MinimumLength = 3)] string Titulo,
    [property: Required] int AutorId,
    [property: Range(1000, 2100)] int Ano);
```

### Controller de API

```csharp
[ApiController]
[Route("api/[controller]")]
public class LivrosController(LivrariaContext db) : ControllerBase
{
    [HttpGet]
    public async Task<ActionResult<IEnumerable<LivroDto>>> Listar(int pagina = 1, int tamanho = 10)
    {
        tamanho = Math.Clamp(tamanho, 1, 50);          // limite máximo: evita abuso
        var itens = await db.Livros.AsNoTracking()
            .OrderBy(l => l.Titulo)
            .Skip((pagina - 1) * tamanho).Take(tamanho)
            .Select(l => new LivroDto(l.Id, l.Titulo, l.Autor.Nome, l.Ano))
            .ToListAsync();
        return Ok(itens);
    }

    [HttpGet("{id:int}")]
    public async Task<ActionResult<LivroDto>> Obter(int id)
    {
        var livro = await db.Livros.AsNoTracking().Where(l => l.Id == id)
            .Select(l => new LivroDto(l.Id, l.Titulo, l.Autor.Nome, l.Ano))
            .FirstOrDefaultAsync();
        return livro is null ? NotFound() : livro;
    }

    [HttpPost]
    public async Task<ActionResult<LivroDto>> Criar(CriarLivroDto dto)
    {
        var autor = await db.Autores.FindAsync(dto.AutorId);
        if (autor is null) return UnprocessableEntity(new { erro = "Autor inexistente." });

        var livro = new Livro { Titulo = dto.Titulo, Ano = dto.Ano, AutorId = autor.Id };
        db.Livros.Add(livro);
        await db.SaveChangesAsync();

        var resposta = new LivroDto(livro.Id, livro.Titulo, autor.Nome, livro.Ano);
        return CreatedAtAction(nameof(Obter), new { id = livro.Id }, resposta);
    }
}
```

`[ApiController]` valida automaticamente o modelo (respondendo `400` com `ProblemDetails`) e infere a origem dos parâmetros. Registro: `builder.Services.AddControllers(); app.MapControllers();`.

### Erros padronizados

```csharp
builder.Services.AddProblemDetails();
app.UseExceptionHandler();
```

Retorne `ProblemDetails` (RFC 9457) com `type`, `title`, `status` e `detail`, sem expor detalhes internos (pilhas, SQL).

### Versionamento, CORS e limites

- Versione a API (`/api/v1/...`) para evoluir sem quebrar clientes.
- CORS somente para origens conhecidas:

```csharp
builder.Services.AddCors(o => o.AddPolicy("front", p =>
    p.WithOrigins("https://meu-front.exemplo").AllowAnyHeader().AllowAnyMethod()));
app.UseCors("front");
```

- *Rate limiting* nativo:

```csharp
builder.Services.AddRateLimiter(o => o.AddFixedWindowLimiter("padrao", l =>
{
    l.PermitLimit = 60;
    l.Window = TimeSpan.FromMinutes(1);
}));
app.UseRateLimiter();
```

### Documentação OpenAPI

`builder.Services.AddOpenApi(); app.MapOpenApi();` gera o documento em `/openapi/v1.json`, que pode alimentar Scalar/Swagger UI e geradores de clientes.

### Consumindo a API com `HttpClient`

```csharp
builder.Services.AddHttpClient("livraria", c => c.BaseAddress = new Uri("https://localhost:5001/"));

app.MapGet("/painel", async (IHttpClientFactory fabrica) =>
{
    var http = fabrica.CreateClient("livraria");
    var livros = await http.GetFromJsonAsync<List<LivroDto>>("api/livros?pagina=1");
    return Results.Ok(livros);
});
```

Use `IHttpClientFactory` (evita esgotar sockets) e defina *timeouts*.

### Consumindo no navegador (JavaScript)

```js
const resposta = await fetch("/api/livros?pagina=1");
if (!resposta.ok) throw new Error(`Falha: ${resposta.status}`);
const livros = await resposta.json();
```

## Exercícios

1. Qual código HTTP usar para "criado com sucesso"? E para "sem conteúdo"?
2. O que é overposting e como DTOs ajudam?
3. Por que limitar `tamanho` na paginação?
4. Diferencie PUT e PATCH.

## Respostas comentadas

1. `201 Created`; `204 No Content`.
2. É o cliente enviar campos que não deveria definir (por exemplo `IsAdmin`); o DTO só contém os campos permitidos.
3. Evita consultas gigantes que sobrecarregam o servidor.
4. PUT substitui o recurso inteiro; PATCH altera partes.

## Desafio

Entregue uma API de livros completa com DTOs, validação, paginação, códigos HTTP corretos, `ProblemDetails`, rate limiting, documento OpenAPI e um front-end estático em `wwwroot` que lista e cadastra livros com `fetch`.

## Referências

- [Web API com ASP.NET Core](https://learn.microsoft.com/aspnet/core/web-api/)
- [Rate limiting](https://learn.microsoft.com/aspnet/core/performance/rate-limit)
- [Diretrizes de design de API REST — Microsoft](https://learn.microsoft.com/azure/architecture/best-practices/api-design)
- [RFC 9110 — HTTP Semantics](https://datatracker.ietf.org/doc/html/rfc9110)
