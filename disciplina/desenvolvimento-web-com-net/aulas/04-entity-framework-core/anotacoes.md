# Minhas anotações: Acesso a dados com Entity Framework Core

## Objetivos

- Mapear classes para tabelas com o EF Core.
- Usar `DbContext`, migrações e consultas LINQ.
- Aplicar boas práticas de desempenho e segurança.

## Conteúdo

O **Entity Framework Core (EF Core)** é um ORM: mapeia objetos C# para tabelas e converte LINQ em SQL. O EF Core 10 acompanha o .NET 10. Para fundamentos de SQL, consulte [Programação de Banco de Dados](../../../programacao-banco-de-dados/README.md); para o uso de EF Core e LINQ em aplicações .NET, veja também [Programação Aplicada em .NET](../../../programacao-aplicada-em-net/README.md).

### Pacotes (exemplo com SQLite, bom para estudo)

```bash
dotnet add package Microsoft.EntityFrameworkCore.Sqlite
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet tool install --global dotnet-ef
```

Para SQL Server: `Microsoft.EntityFrameworkCore.SqlServer`; para PostgreSQL: `Npgsql.EntityFrameworkCore.PostgreSQL`; para MySQL: provedor compatível com sua versão do EF Core (confirme na documentação do provedor).

### Modelo e contexto

```csharp
using Microsoft.EntityFrameworkCore;

public class Livro
{
    public int Id { get; set; }
    public string Titulo { get; set; } = "";
    public int Ano { get; set; }
    public int AutorId { get; set; }
    public Autor Autor { get; set; } = null!;
}

public class Autor
{
    public int Id { get; set; }
    public string Nome { get; set; } = "";
    public List<Livro> Livros { get; set; } = [];
}

public class LivrariaContext(DbContextOptions<LivrariaContext> opcoes) : DbContext(opcoes)
{
    public DbSet<Livro> Livros => Set<Livro>();
    public DbSet<Autor> Autores => Set<Autor>();

    protected override void OnModelCreating(ModelBuilder mb)
    {
        mb.Entity<Livro>(e =>
        {
            e.Property(l => l.Titulo).IsRequired().HasMaxLength(150);
            e.HasIndex(l => l.Titulo);
        });
        mb.Entity<Autor>().Property(a => a.Nome).IsRequired().HasMaxLength(100);
    }
}
```

### Registro e string de conexão

```csharp
builder.Services.AddDbContext<LivrariaContext>(o =>
    o.UseSqlite(builder.Configuration.GetConnectionString("Livraria")));
```

```json
{ "ConnectionStrings": { "Livraria": "Data Source=livraria.db" } }
```

### Migrações

```bash
dotnet ef migrations add Inicial
dotnet ef database update
```

Migrações versionam o esquema do banco junto com o código. Em produção, aplique-as com um processo controlado (script SQL ou *bundle*) e não automaticamente na inicialização da aplicação.

### Consultas com LINQ

```csharp
app.MapGet("/livros", async (LivrariaContext db, string? busca, int pagina = 1) =>
{
    var consulta = db.Livros.AsNoTracking();             // leitura: sem rastreamento

    if (!string.IsNullOrWhiteSpace(busca))
        consulta = consulta.Where(l => l.Titulo.Contains(busca));

    return await consulta
        .OrderBy(l => l.Titulo)
        .Skip((pagina - 1) * 10).Take(10)                // paginação
        .Select(l => new { l.Id, l.Titulo, Autor = l.Autor.Nome })  // projeção
        .ToListAsync();
});
```

O texto de `busca` vira **parâmetro SQL** (protegido contra injeção de SQL). Cuidado com `FromSqlRaw` + concatenação; use `FromSql` com interpolação segura ou `FromSqlInterpolated`.

### Inserção, alteração e exclusão

```csharp
app.MapPost("/autores", async (LivrariaContext db, Autor autor) =>
{
    db.Autores.Add(autor);
    await db.SaveChangesAsync();         // grava em uma transação
    return Results.Created($"/autores/{autor.Id}", autor);
});

app.MapDelete("/livros/{id:int}", async (int id, LivrariaContext db) =>
{
    var linhas = await db.Livros.Where(l => l.Id == id).ExecuteDeleteAsync();   // sem carregar a entidade
    return linhas > 0 ? Results.NoContent() : Results.NotFound();
});
```

### Carregamento de relacionados e o problema N+1

```csharp
var comAutor = await db.Livros.Include(l => l.Autor).ToListAsync();   // 1 consulta com JOIN
```

Percorrer `livro.Autor` em um laço sem `Include`/projeção pode gerar uma consulta por item (N+1). Prefira `Select` com os campos necessários.

### Boas práticas

1. `DbContext` com ciclo de vida *scoped* (padrão do `AddDbContext`).
2. `AsNoTracking()` em consultas só de leitura.
3. Paginação e projeções; nunca devolver entidades inteiras com relacionamentos circulares diretamente da API: use DTOs.
4. Índices para colunas filtradas; verifique o SQL gerado com `ToQueryString()` ou logs.
5. Concorrência otimista com `[Timestamp]`/token de concorrência quando necessário.
6. Dados de teste: *seed* (`HasData`) com moderação.

```csharp
Console.WriteLine(db.Livros.Where(l => l.Ano > 2000).ToQueryString());
```

## Exercícios

1. O que as migrações fazem?
2. Quando usar `AsNoTracking`?
3. O que é o problema N+1 e como evitá-lo?
4. Por que o EF Core protege contra injeção de SQL em `Where(l => l.Titulo.Contains(busca))`?

## Respostas comentadas

1. Registram as mudanças do modelo como código versionado e as aplicam ao esquema do banco.
2. Em consultas somente de leitura, para evitar o custo de rastrear as entidades.
3. Uma consulta inicial mais uma por item relacionado; evita-se com `Include` ou projeção.
4. O valor é enviado como parâmetro SQL, separado do comando.

## Desafio

Persista o CRUD de livros/autores da aula 02 em SQLite com EF Core, adicione migração, paginação, busca por título e um teste que garanta que a busca não é afetada por aspas e símbolos na entrada.

## Referências

- [Documentação do EF Core](https://learn.microsoft.com/ef/core/)
- [Migrações](https://learn.microsoft.com/ef/core/managing-schemas/migrations/)
- [Desempenho no EF Core](https://learn.microsoft.com/ef/core/performance/)
