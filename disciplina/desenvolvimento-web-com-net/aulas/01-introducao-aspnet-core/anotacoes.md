# Minhas anotações: Introdução ao ASP.NET Core, ambiente e pipeline HTTP

## Objetivos

- Instalar o SDK e criar o primeiro projeto web.
- Entender a estrutura de um projeto ASP.NET Core e o `Program.cs`.
- Compreender o pipeline de middleware e a configuração.

## Conteúdo

**ASP.NET Core** é o framework web multiplataforma da Microsoft sobre o .NET. Este material usa **.NET 10 (LTS)** e C# 14; confira a política de suporte e as versões atuais em [dotnet.microsoft.com/platform/support/policy](https://dotnet.microsoft.com/platform/support/policy/dotnet-core).

### Ambiente

```bash
dotnet --version              # confirme o SDK instalado
dotnet new list web           # modelos web disponíveis
dotnet new web -n MeuPrimeiroSite
cd MeuPrimeiroSite
dotnet run
```

O terminal mostra a URL local (por exemplo `http://localhost:5xxx`). Use `dotnet dev-certs https --trust` para confiar no certificado de desenvolvimento HTTPS.

### Estrutura do projeto

```text
MeuPrimeiroSite/
├── MeuPrimeiroSite.csproj    # alvo (net10.0), pacotes e configuração do projeto
├── Program.cs                # ponto de entrada e configuração do app
├── appsettings.json          # configurações
├── appsettings.Development.json
└── Properties/launchSettings.json   # perfis de execução locais
```

### `Program.cs` (modelo mínimo)

```csharp
var builder = WebApplication.CreateBuilder(args);   // 1. configura serviços e configuração
var app = builder.Build();                          // 2. constrói a aplicação

app.MapGet("/", () => "Olá, ASP.NET Core!");        // 3. define endpoints

app.Run();                                          // 4. inicia o servidor
```

### Pipeline de middleware

Cada requisição passa por uma sequência de **middlewares**; cada um pode agir antes e depois do próximo.

```text
Requisição → [Tratamento de exceções] → [HTTPS] → [Arquivos estáticos] → [Roteamento] → [Autenticação] → [Autorização] → Endpoint
```

```csharp
var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/erro");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();        // serve wwwroot/

// Middleware personalizado
app.Use(async (context, next) =>
{
    var inicio = DateTime.UtcNow;
    await next(context);
    app.Logger.LogInformation("{Metodo} {Caminho} -> {Status} em {Ms} ms",
        context.Request.Method, context.Request.Path, context.Response.StatusCode,
        (DateTime.UtcNow - inicio).TotalMilliseconds);
});

app.MapGet("/", () => "Olá!");
```

**A ordem importa**: a autenticação deve vir antes da autorização, e ambas antes dos endpoints que protegem.

### Configuração e ambientes

`appsettings.json` + `appsettings.{Ambiente}.json` + variáveis de ambiente + argumentos de linha de comando (a última fonte vence). O ambiente vem de `ASPNETCORE_ENVIRONMENT` (`Development`, `Staging`, `Production`).

```json
{
  "Loja": { "Nome": "Livraria Demo", "ItensPorPagina": 10 }
}
```

```csharp
var nome = builder.Configuration["Loja:Nome"];

// Preferível: configuração fortemente tipada
builder.Services.Configure<LojaOpcoes>(builder.Configuration.GetSection("Loja"));

public class LojaOpcoes
{
    public string Nome { get; set; } = "";
    public int ItensPorPagina { get; set; } = 10;
}
```

**Segredos** (senhas, chaves) não vão em `appsettings.json` versionado. Em desenvolvimento use *User Secrets* (`dotnet user-secrets init` / `set`); em produção, variáveis de ambiente ou cofre de segredos.

### Injeção de dependência (DI)

O contêiner de DI é nativo. Registre serviços e receba-os por parâmetro.

```csharp
builder.Services.AddSingleton<IRelogio, RelogioSistema>();   // uma instância para o app
// AddScoped: uma por requisição  |  AddTransient: uma por uso

app.MapGet("/hora", (IRelogio relogio) => relogio.Agora());

public interface IRelogio { DateTime Agora(); }
public class RelogioSistema : IRelogio { public DateTime Agora() => DateTime.Now; }
```

### Ferramentas úteis

`dotnet watch` (recarrega ao salvar), `dotnet build`, `dotnet test`, `dotnet publish`.

## Exercícios

1. Crie uma rota `/sobre` que devolva um texto.
2. Qual a diferença entre `AddScoped` e `AddSingleton`?
3. Por que `UseAuthorization` não pode vir antes de `UseAuthentication`?
4. Onde guardar a string de conexão do banco em desenvolvimento?

## Respostas comentadas

1. `app.MapGet("/sobre", () => "Projeto de estudo");`
2. Scoped: uma instância por requisição; Singleton: uma instância para toda a aplicação.
3. A autorização depende da identidade já estabelecida pela autenticação.
4. Em *User Secrets* ou variável de ambiente, nunca no repositório.

## Desafio

Crie um site que mostre no `/` o nome da loja vindo de `appsettings.json` por configuração tipada, registre em log o tempo de cada requisição por middleware e exponha `/saude` retornando `"ok"`.

## Referências

- [Documentação do ASP.NET Core](https://learn.microsoft.com/aspnet/core/)
- [Middleware do ASP.NET Core](https://learn.microsoft.com/aspnet/core/fundamentals/middleware/)
- [Injeção de dependência](https://learn.microsoft.com/aspnet/core/fundamentals/dependency-injection)
- [Configuração](https://learn.microsoft.com/aspnet/core/fundamentals/configuration/)
