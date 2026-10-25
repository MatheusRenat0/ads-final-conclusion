# Minhas anotações: Blazor: interfaces web interativas com C#

## Objetivos

- Entender o que é o Blazor e seus modos de renderização.
- Criar componentes com parâmetros, eventos e formulários.
- Consumir uma API a partir de componentes.

## Conteúdo

**Blazor** permite construir interfaces web interativas com **C# e Razor**, em vez de JavaScript, usando **componentes** reutilizáveis (`.razor`). O modelo **Blazor Web App** unifica as formas de hospedagem.

```bash
dotnet new blazor -n LivrariaBlazor
```

### Modos de renderização

| Modo | Onde roda a interatividade | Observações |
|---|---|---|
| Servidor estático (SSR) | servidor, sem interatividade contínua | rápido, ótimo para conteúdo e formulários simples |
| Interativo Servidor | servidor, UI atualizada por conexão SignalR | latência de rede; mantém estado no servidor |
| Interativo WebAssembly | navegador (código .NET em WebAssembly) | download inicial maior; funciona offline |
| Interativo Auto | começa no servidor e migra para WebAssembly | equilíbrio entre início rápido e execução no cliente |

Escolha por requisitos de latência, escala, tamanho de download e segurança.

### Componente básico

```razor
@* Components/Contador.razor *@
@rendermode InteractiveServer

<h3>Contador</h3>
<p>Valor: <strong>@valor</strong></p>
<button class="btn btn-primary" @onclick="Incrementar">Somar</button>

@code {
    private int valor;
    private void Incrementar() => valor++;
}
```

### Parâmetros e eventos

```razor
@* Components/CartaoLivro.razor *@
<div class="card">
    <h4>@Livro.Titulo</h4>
    <p>@Livro.Autor (@Livro.Ano)</p>
    <button @onclick="() => AoSelecionar.InvokeAsync(Livro)">Selecionar</button>
</div>

@code {
    [Parameter, EditorRequired] public LivroDto Livro { get; set; } = default!;
    [Parameter] public EventCallback<LivroDto> AoSelecionar { get; set; }
}
```

Uso: `<CartaoLivro Livro="l" AoSelecionar="Selecionar" />`.

### Formulários e validação

```razor
@page "/livros/novo"
@rendermode InteractiveServer
@using System.ComponentModel.DataAnnotations

<EditForm Model="modelo" OnValidSubmit="Salvar" FormName="novoLivro">
    <DataAnnotationsValidator />
    <ValidationSummary />

    <label for="titulo">Título</label>
    <InputText id="titulo" @bind-Value="modelo.Titulo" class="form-control" />
    <ValidationMessage For="() => modelo.Titulo" />

    <button type="submit" class="btn btn-success">Salvar</button>
</EditForm>

@code {
    private NovoLivro modelo = new();

    private async Task Salvar() { /* chamar o serviço ou a API */ await Task.CompletedTask; }

    private class NovoLivro
    {
        [Required, StringLength(150, MinimumLength = 3)]
        public string Titulo { get; set; } = "";
    }
}
```

### Consumo de API

```csharp
// Program.cs
builder.Services.AddHttpClient<LivrosApi>(c => c.BaseAddress = new Uri("https://localhost:5001/"));

public class LivrosApi(HttpClient http)
{
    public Task<List<LivroDto>?> ListarAsync() => http.GetFromJsonAsync<List<LivroDto>>("api/livros");
}
```

```razor
@page "/livros"
@inject LivrosApi Api
@rendermode InteractiveServer

@if (livros is null)
{
    <p>Carregando...</p>
}
else
{
    @foreach (var l in livros)
    {
        <CartaoLivro Livro="l" AoSelecionar="Selecionar" />
    }
}

@code {
    private List<LivroDto>? livros;
    protected override async Task OnInitializedAsync() => livros = await Api.ListarAsync();
    private void Selecionar(LivroDto l) { }
}
```

### Ciclo de vida e boas práticas

- `OnInitializedAsync`, `OnParametersSet`, `OnAfterRender`.
- Evite lógica pesada no componente: extraia para serviços e teste-os.
- Trate estados de carregamento e erro.
- Interop com JavaScript (`IJSRuntime`) quando precisar de APIs do navegador.
- Acessibilidade: continue usando HTML semântico, rótulos e navegação por teclado.
- Segurança: a autorização deve ser aplicada também **no servidor/API**; ocultar um componente no cliente não protege os dados.

### Quando escolher Blazor

Equipes C# que querem reutilizar código e modelos entre cliente e servidor, painéis internos e aplicações de formulários ricos. Para sites majoritariamente de conteúdo ou equipes que já dominam um framework JavaScript (React, Vue, Angular), uma API ASP.NET Core com esse front-end também é uma escolha válida.

## Exercícios

1. Qual a diferença entre Blazor Server e WebAssembly?
2. Para que serve `[Parameter]`?
3. Como tratar o estado "carregando" de uma lista?
4. Por que a autorização deve existir também na API?

## Respostas comentadas

1. No modo servidor a interface roda no servidor e envia atualizações por SignalR; no WebAssembly o código .NET roda no navegador.
2. Permite que o componente pai passe dados ao filho.
3. Use um campo nulo/flag e exiba "Carregando..." até concluir a chamada assíncrona.
4. O cliente pode ser manipulado; só o servidor é confiável para impor regras de acesso.

## Desafio

Crie uma página Blazor que liste livros da API, tenha busca com filtro por título, formulário para cadastrar um novo livro com validação e mensagens de erro acessíveis.

## Referências

- [Documentação do Blazor](https://learn.microsoft.com/aspnet/core/blazor/)
- [Modos de renderização do Blazor](https://learn.microsoft.com/aspnet/core/blazor/components/render-modes)
- [Formulários e validação no Blazor](https://learn.microsoft.com/aspnet/core/blazor/forms/)
