# Minhas anotações: Autenticação e autorização com ASP.NET Core Identity

## Objetivos

- Diferenciar autenticação e autorização no ASP.NET Core.
- Usar o ASP.NET Core Identity para contas e senhas.
- Proteger endpoints com políticas e papéis; conhecer JWT.

## Conteúdo

Reveja os conceitos gerais em [Cibersegurança, aulas 02 e 03](../../../ciberseguranca/README.md). Aqui, a aplicação em ASP.NET Core.

### ASP.NET Core Identity

Biblioteca oficial para cadastro, login, senhas com hash seguro, bloqueio de conta, confirmação de e-mail, recuperação de senha, autenticação em dois fatores e papéis. **Não implemente armazenamento de senhas por conta própria.**

```bash
dotnet new mvc --auth Individual -n LivrariaSegura      # modelo com Identity e EF Core
```

Configuração típica (modelo com `IdentityUser`):

```csharp
builder.Services.AddDefaultIdentity<IdentityUser>(o =>
{
    o.Password.RequiredLength = 12;
    o.Lockout.MaxFailedAccessAttempts = 5;
    o.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(15);
    o.User.RequireUniqueEmail = true;
    o.SignIn.RequireConfirmedEmail = true;
})
.AddRoles<IdentityRole>()
.AddEntityFrameworkStores<ApplicationDbContext>();
```

O Identity usa um *hasher* de senha com salt e iterações (PBKDF2 por padrão) e atualiza o hash quando os parâmetros evoluem. Para APIs com Identity, o .NET oferece endpoints prontos: `app.MapIdentityApi<IdentityUser>();` (ideal para estudo e SPAs próprias; avalie provedores como Microsoft Entra ID, Keycloak ou Duende para cenários corporativos).

### Cookies de autenticação

Aplicações web renderizadas no servidor (MVC/Razor Pages) usam **cookie** de sessão (`HttpOnly`, `Secure`, `SameSite`). Combine com proteção anti-CSRF.

```csharp
builder.Services.ConfigureApplicationCookie(o =>
{
    o.Cookie.HttpOnly = true;
    o.Cookie.SecurePolicy = CookieSecurePolicy.Always;
    o.Cookie.SameSite = SameSiteMode.Lax;
    o.ExpireTimeSpan = TimeSpan.FromHours(8);
    o.SlidingExpiration = true;
});
```

### Autorização

```csharp
[Authorize]                              // exige usuário autenticado
public class MinhaContaController : Controller { }

[Authorize(Roles = "Admin")]             // papel
public IActionResult Painel() => View();

[AllowAnonymous]                         // libera exceção
public IActionResult Publico() => View();
```

**Políticas** são mais flexíveis que papéis:

```csharp
builder.Services.AddAuthorizationBuilder()
    .AddPolicy("PodeGerenciarLivros", p => p.RequireRole("Admin", "Bibliotecario"))
    .AddPolicy("Maior18", p => p.RequireAssertion(ctx =>
        ctx.User.HasClaim(c => c.Type == "idade" && int.Parse(c.Value) >= 18)));

app.MapDelete("/api/livros/{id:int}", (int id) => Results.NoContent())
   .RequireAuthorization("PodeGerenciarLivros");
```

Verificação em **nível de recurso** (impede acesso a dados de outros usuários):

```csharp
app.MapGet("/api/pedidos/{id:int}", async (int id, ClaimsPrincipal usuario, LivrariaContext db) =>
{
    var uid = usuario.FindFirstValue(ClaimTypes.NameIdentifier);
    var pedido = await db.Pedidos.FirstOrDefaultAsync(p => p.Id == id && p.UsuarioId == uid);
    return pedido is null ? Results.NotFound() : Results.Ok(pedido);   // 404 evita revelar a existência
}).RequireAuthorization();
```

### Tokens JWT para APIs

APIs consumidas por aplicativos móveis ou SPAs podem usar **JWT Bearer**: token assinado contendo *claims*, enviado em `Authorization: Bearer <token>`.

```csharp
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(o =>
    {
        o.Authority = "https://meu-provedor-de-identidade";   // emissor confiável
        o.Audience = "api-livraria";
    });
```

Boas práticas: tempo de expiração curto, validação de emissor/audiência/assinatura, *refresh tokens* controlados, nunca guardar segredos no front-end. Prefira que um **provedor de identidade** (OpenID Connect) emita tokens, em vez de gerar JWT manualmente com uma chave simétrica no próprio app.

### Segredos e HTTPS

Chaves e strings de conexão em User Secrets/variáveis de ambiente; HTTPS e HSTS em produção; proteção de dados do ASP.NET (Data Protection) com armazenamento de chaves persistente quando houver várias instâncias.

### Checklist

1. Senhas gerenciadas pelo Identity; MFA disponível.
2. `[Authorize]` por padrão (política fallback) e exceções explícitas.
3. Autorização por recurso nas operações com dados do usuário.
4. Cookies seguros e anti-CSRF.
5. Limite de tentativas, logs de autenticação e rate limiting no login.

```csharp
builder.Services.AddAuthorizationBuilder()
    .SetFallbackPolicy(new AuthorizationPolicyBuilder().RequireAuthenticatedUser().Build());
```

## Exercícios

1. Qual a diferença entre `[Authorize]` e `[Authorize(Roles = "Admin")]`?
2. Por que verificar o dono do recurso além do papel?
3. Vantagem de políticas sobre papéis?
4. Por que não guardar um JWT em `localStorage` sem refletir sobre XSS?

## Respostas comentadas

1. A primeira exige autenticação; a segunda exige também pertencer ao papel.
2. Papéis dizem o que o usuário pode fazer em geral, não sobre quais objetos; sem a verificação, há acesso indevido a dados de outros (IDOR).
3. Expressam regras mais ricas (claims, requisitos personalizados, recursos).
4. Se houver XSS, scripts maliciosos leem o `localStorage` e roubam o token; cookies `HttpOnly` reduzem esse risco.

## Desafio

Adicione ao projeto de livros: cadastro e login com Identity, papéis "Admin" e "Leitor", política que permita só ao Admin criar e excluir, favoritos por usuário com autorização por recurso e testes automatizados que comprovem os acessos negados.

## Referências

- [Autenticação e autorização no ASP.NET Core](https://learn.microsoft.com/aspnet/core/security/)
- [ASP.NET Core Identity](https://learn.microsoft.com/aspnet/core/security/authentication/identity)
- [Autorização baseada em políticas](https://learn.microsoft.com/aspnet/core/security/authorization/policies)
- [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)
