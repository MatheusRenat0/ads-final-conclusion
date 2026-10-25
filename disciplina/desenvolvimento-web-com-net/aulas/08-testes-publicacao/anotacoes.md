# Minhas anotações: Testes, observabilidade e publicação

## Objetivos

- Escrever testes unitários e de integração para APIs.
- Configurar logs, saúde e tratamento de erros.
- Publicar a aplicação (Kestrel, contêiner, nuvem) com configuração segura.

## Conteúdo

### Pirâmide de testes

| Tipo | Escopo | Ferramentas |
|---|---|---|
| Unitário | regras isoladas | xUnit, NUnit, MSTest |
| Integração | API + banco + pipeline real | `WebApplicationFactory`, SQLite em memória, Testcontainers |
| Ponta a ponta | fluxo completo no navegador | Playwright |

```bash
dotnet new xunit -n Livraria.Tests
dotnet add Livraria.Tests reference ../Livraria/Livraria.csproj
dotnet add Livraria.Tests package Microsoft.AspNetCore.Mvc.Testing
dotnet test
```

### Teste unitário

```csharp
public class CalculadoraDeMultaTests
{
    [Theory]
    [InlineData(0, 0)]
    [InlineData(3, 1.5)]
    [InlineData(10, 5.0)]
    public void Multa_e_proporcional_aos_dias_de_atraso(int dias, decimal esperado)
    {
        var multa = new CalculadoraDeMulta(valorPorDia: 0.50m).Calcular(dias);
        Assert.Equal(esperado, multa);
    }
}
```

### Teste de integração com `WebApplicationFactory`

Torne o `Program` acessível aos testes adicionando ao final de `Program.cs` (em projetos com instruções de nível superior):

```csharp
public partial class Program { }
```

```csharp
public class LivrosApiTests(WebApplicationFactory<Program> fabrica) : IClassFixture<WebApplicationFactory<Program>>
{
    [Fact]
    public async Task Get_livros_retorna_200()
    {
        var cliente = fabrica.CreateClient();
        var resposta = await cliente.GetAsync("/api/livros");

        Assert.Equal(HttpStatusCode.OK, resposta.StatusCode);
    }

    [Fact]
    public async Task Post_com_dados_invalidos_retorna_400()
    {
        var cliente = fabrica.CreateClient();
        var resposta = await cliente.PostAsJsonAsync("/api/livros", new { titulo = "", autorId = 1, ano = 2020 });

        Assert.Equal(HttpStatusCode.BadRequest, resposta.StatusCode);
    }
}
```

Para isolar o banco, substitua o `DbContext` por um banco de teste (SQLite em memória ou contêiner) em `WithWebHostBuilder`.

Teste também **cenários de segurança**: acesso sem login (401), sem permissão (403) e a recursos de outros usuários (404).

### Logs, saúde e métricas

```csharp
builder.Services.AddHealthChecks().AddDbContextCheck<LivrariaContext>();
app.MapHealthChecks("/saude");

app.Logger.LogInformation("Aplicação iniciada em {Ambiente}", app.Environment.EnvironmentName);
```

Use log estruturado (`{Propriedade}`), níveis adequados e **não registre dados sensíveis** (senhas, tokens). Para observabilidade moderna, adote **OpenTelemetry** (traces, métricas e logs) com um coletor de sua escolha.

### Publicação

```bash
dotnet publish -c Release -o publicar
```

Opções de hospedagem: Azure App Service, contêineres (Azure Container Apps, Kubernetes), VMs com Kestrel atrás de proxy reverso (Nginx, IIS, YARP), outras nuvens.

### Contêiner (Docker)

```dockerfile
# Dockerfile (imagens oficiais da Microsoft; confirme as tags vigentes)
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
COPY --from=build /app .
USER $APP_UID
ENV ASPNETCORE_HTTP_PORTS=8080
EXPOSE 8080
ENTRYPOINT ["dotnet", "Livraria.dll"]
```

O `.NET SDK` também publica contêineres sem Dockerfile (`dotnet publish /t:PublishContainer`). Execute como usuário não root.

### Configuração em produção

- `ASPNETCORE_ENVIRONMENT=Production`.
- Strings de conexão e chaves por variáveis de ambiente ou cofre de segredos.
- HTTPS (TLS terminado no proxy ou no Kestrel), HSTS, cabeçalhos de segurança.
- Migrações aplicadas por etapa controlada de implantação.
- Páginas de erro genéricas; sem `UseDeveloperExceptionPage`.

### CI/CD (visão geral)

```yaml
name: ci
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-dotnet@v4
        with: { dotnet-version: "10.0.x" }
      - run: dotnet restore
      - run: dotnet build --no-restore -c Release
      - run: dotnet test --no-build -c Release
      - run: dotnet list package --vulnerable --include-transitive
```

A integração com Cloud e DevOps é aprofundada em [Cloud Computing e DevOps](../../../cloud-computing-e-devops/README.md).

### Checklist final de qualidade

1. Testes automatizados passando.
2. Dependências sem vulnerabilidades conhecidas.
3. Segredos fora do repositório.
4. Logs e verificação de saúde configurados.
5. Documentação (README, OpenAPI) atualizada.

## Exercícios

1. Qual a diferença entre teste unitário e de integração?
2. Para que serve `WebApplicationFactory`?
3. Por que não aplicar migrações automaticamente na inicialização em produção?
4. Por que executar o contêiner como usuário não root?

## Respostas comentadas

1. O unitário testa uma unidade isolada; o de integração exercita componentes reais trabalhando juntos.
2. Hospeda a aplicação em memória para testes, enviando requisições HTTP reais ao pipeline.
3. Com várias instâncias há concorrência, falhas parciais e risco de mudanças destrutivas sem revisão.
4. Limita o impacto de uma eventual invasão do contêiner (menor privilégio).

## Desafio

Complete o projeto de livros com: pelo menos cinco testes de integração (incluindo 401, 403 e 400), health check, Dockerfile, workflow de CI e um README com instruções de execução, testes e variáveis de ambiente necessárias.

## Referências

- [Testes de integração no ASP.NET Core](https://learn.microsoft.com/aspnet/core/test/integration-tests)
- [Hospedagem e implantação](https://learn.microsoft.com/aspnet/core/host-and-deploy/)
- [Contêineres com .NET](https://learn.microsoft.com/dotnet/core/docker/introduction)
- [OpenTelemetry para .NET](https://opentelemetry.io/docs/languages/dotnet/)
