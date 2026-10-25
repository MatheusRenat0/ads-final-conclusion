# Minhas anotações: MVC e Razor Pages: páginas renderizadas no servidor

## Objetivos

- Entender o padrão MVC e a sintaxe Razor.
- Criar controllers, views e modelos.
- Conhecer Razor Pages e Tag Helpers.

## Conteúdo

### MVC

**Model-View-Controller** separa responsabilidades:

- **Model**: dados e regras.
- **View**: apresentação (HTML com Razor).
- **Controller**: recebe a requisição, usa o modelo e escolhe a view.

```bash
dotnet new mvc -n LivrariaMvc
```

### Controller e View

```csharp
// Controllers/LivrosController.cs
public class LivrosController : Controller
{
    private static readonly List<Livro> _livros =
    [
        new(1, "Clean Code", "Robert C. Martin"),
        new(2, "Domain-Driven Design", "Eric Evans"),
    ];

    public IActionResult Index() => View(_livros);

    public IActionResult Detalhes(int id)
    {
        var livro = _livros.FirstOrDefault(l => l.Id == id);
        return livro is null ? NotFound() : View(livro);
    }
}

public record Livro(int Id, string Titulo, string Autor);
```

```cshtml
@* Views/Livros/Index.cshtml *@
@model IEnumerable<Livro>

<h1>Livros</h1>
<ul>
@foreach (var livro in Model)
{
    <li><a asp-action="Detalhes" asp-route-id="@livro.Id">@livro.Titulo</a> — @livro.Autor</li>
}
</ul>
```

### Razor

- `@` inicia código C# no HTML; `@Model` acessa o modelo.
- **Codificação HTML automática**: `@livro.Titulo` já escapa o conteúdo (proteção contra XSS). Use `Html.Raw` só com conteúdo confiável.
- *Layouts* (`_Layout.cshtml`), *partials* e *view components* reaproveitam interface.

### Tag Helpers

Estendem o HTML com atributos `asp-*`:

```cshtml
<a asp-controller="Livros" asp-action="Index">Todos</a>

<form asp-action="Criar" method="post">
    <label asp-for="Titulo"></label>
    <input asp-for="Titulo" class="form-control" />
    <span asp-validation-for="Titulo" class="text-danger"></span>
    <button type="submit">Salvar</button>
</form>
```

### Formulários, validação e anti-CSRF

```csharp
public class LivroForm
{
    [Required(ErrorMessage = "Informe o título.")]
    [StringLength(100, MinimumLength = 3)]
    public string Titulo { get; set; } = "";

    [Required]
    public string Autor { get; set; } = "";
}

[HttpGet]
public IActionResult Criar() => View(new LivroForm());

[HttpPost, ValidateAntiForgeryToken]
public IActionResult Criar(LivroForm form)
{
    if (!ModelState.IsValid)
        return View(form);                 // reexibe com mensagens de erro

    // salvar...
    return RedirectToAction(nameof(Index));   // padrão Post-Redirect-Get
}
```

O Tag Helper de formulário inclui automaticamente o token anti-CSRF.

### Razor Pages

Modelo orientado à **página**: cada página tem um arquivo `.cshtml` e uma classe `PageModel`. Simples para telas de formulário e CRUD.

```cshtml
@* Pages/Livros/Criar.cshtml *@
@page
@model CriarModel

<form method="post">
    <input asp-for="Form.Titulo" />
    <span asp-validation-for="Form.Titulo"></span>
    <button>Salvar</button>
</form>
```

```csharp
public class CriarModel : PageModel
{
    [BindProperty] public LivroForm Form { get; set; } = new();

    public IActionResult OnPost()
    {
        if (!ModelState.IsValid) return Page();
        return RedirectToPage("Index");
    }
}
```

### MVC × Razor Pages × Minimal APIs × Blazor

| Opção | Indicada para |
|---|---|
| MVC | aplicações grandes com controllers e views |
| Razor Pages | sites e formulários centrados em páginas |
| Minimal APIs / Web API | serviços HTTP e back-end de SPAs/mobile |
| Blazor | interfaces interativas em C# (aula 07) |

Podem coexistir no mesmo projeto.

### Arquivos estáticos e responsividade

`wwwroot/` serve CSS, JS e imagens. Os modelos MVC/Razor Pages trazem Bootstrap; mantenha as boas práticas de HTML semântico e acessibilidade vistas em [Desenvolvimento Web Responsivo](../../../desenvolvimento-web-responsivo/README.md).

## Exercícios

1. Qual a função do `ValidateAntiForgeryToken`?
2. Por que `@livro.Titulo` é seguro contra XSS?
3. O que é o padrão Post-Redirect-Get?
4. Quando escolher Razor Pages em vez de MVC?

## Respostas comentadas

1. Protege contra CSRF exigindo o token que só o formulário legítimo possui.
2. O Razor codifica o HTML da saída por padrão.
3. Após processar um POST, redirecionar para um GET evita reenvio do formulário ao recarregar a página.
4. Quando as telas são basicamente páginas independentes com formulários, simplificando a organização.

## Desafio

Crie um CRUD de livros (listar, detalhar, criar, editar, excluir) em MVC ou Razor Pages, com validação, mensagens de erro, layout responsivo e confirmação antes de excluir.

## Referências

- [Visão geral do MVC](https://learn.microsoft.com/aspnet/core/mvc/overview)
- [Razor Pages — introdução](https://learn.microsoft.com/aspnet/core/razor-pages/)
- [Sintaxe Razor](https://learn.microsoft.com/aspnet/core/mvc/views/razor)
- [Tag Helpers](https://learn.microsoft.com/aspnet/core/mvc/views/tag-helpers/intro)
