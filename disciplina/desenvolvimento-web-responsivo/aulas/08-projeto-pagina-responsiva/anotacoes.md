# Minhas anotações: Projeto prático — página responsiva

## Objetivo

Construir a página de uma landing page de um curso fictício ("Oficina de Programação"), integrando HTML semântico, CSS moderno, JavaScript e acessibilidade.

## Requisitos

1. Cabeçalho com menu (hambúrguer em telas estreitas).
2. Seção principal (*hero*) com chamada para ação.
3. Seção de benefícios em grade de cards.
4. Depoimentos (fictícios, claramente identificados como exemplo).
5. Formulário de inscrição com validação.
6. Rodapé.
7. Responsivo (360 px a 1440 px), tema escuro automático e acessível por teclado.

## `index.html`

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Oficina de Programação</title>
  <meta name="description" content="Landing page de exemplo de um curso de programação.">
  <link rel="stylesheet" href="styles.css">
  <script src="script.js" defer></script>
</head>
<body>
  <a class="pular" href="#conteudo">Pular para o conteúdo</a>
  <header class="topo">
    <a class="logo" href="#">Oficina<span>Dev</span></a>
    <button id="menu-botao" aria-expanded="false" aria-controls="menu">Menu</button>
    <nav id="menu" aria-label="Principal">
      <ul>
        <li><a href="#beneficios">Benefícios</a></li>
        <li><a href="#inscricao">Inscrição</a></li>
      </ul>
    </nav>
  </header>

  <main id="conteudo">
    <section class="hero">
      <h1>Aprenda a programar na prática</h1>
      <p>Turmas pequenas, projetos reais e acompanhamento próximo.</p>
      <a class="botao" href="#inscricao">Quero me inscrever</a>
    </section>

    <section id="beneficios" class="container">
      <h2>Por que participar</h2>
      <div class="grade">
        <article class="card"><h3>Projetos reais</h3><p>Você constrói portfólio desde a primeira semana.</p></article>
        <article class="card"><h3>Turmas pequenas</h3><p>Mais atenção para tirar dúvidas.</p></article>
        <article class="card"><h3>Flexível</h3><p>Aulas gravadas e encontros semanais.</p></article>
      </div>
    </section>

    <section id="inscricao" class="container">
      <h2>Inscrição</h2>
      <form id="form" novalidate>
        <label for="nome">Nome</label>
        <input id="nome" name="nome" required minlength="3" autocomplete="name">
        <p class="erro" id="erro-nome" role="alert"></p>
        <label for="email">E-mail</label>
        <input id="email" name="email" type="email" required autocomplete="email">
        <p class="erro" id="erro-email" role="alert"></p>
        <button class="botao" type="submit">Enviar</button>
        <p id="status" aria-live="polite"></p>
      </form>
    </section>
  </main>

  <footer class="container"><small>&copy; 2026 Oficina Dev – página fictícia para estudo.</small></footer>
</body>
</html>
```

## `styles.css`

```css
:root {
  --fundo: #ffffff; --texto: #1b1f24; --primaria: #1a56db; --borda: #d0d7de; --card: #f6f8fa;
}
@media (prefers-color-scheme: dark) {
  :root { --fundo: #0d1117; --texto: #e6edf3; --primaria: #6ea8fe; --borda: #30363d; --card: #161b22; }
}
*, *::before, *::after { box-sizing: border-box; }
body { margin: 0; font-family: system-ui, sans-serif; line-height: 1.6; background: var(--fundo); color: var(--texto); }
img { max-width: 100%; height: auto; }
a { color: var(--primaria); }
:focus-visible { outline: 3px solid var(--primaria); outline-offset: 2px; }

.pular { position: absolute; left: -999px; }
.pular:focus { left: 1rem; top: 1rem; background: var(--fundo); padding: .5rem; z-index: 10; }
.container { width: min(100% - 2rem, 70rem); margin-inline: auto; padding-block: 2rem; }

.topo { display: flex; flex-wrap: wrap; justify-content: space-between; align-items: center; gap: 1rem; padding: 1rem; border-bottom: 1px solid var(--borda); }
.logo { font-weight: 700; text-decoration: none; color: inherit; }
.logo span { color: var(--primaria); }
#menu ul { list-style: none; margin: 0; padding: 0; display: flex; gap: 1rem; }
#menu-botao { display: none; }
@media (max-width: 40em) {
  #menu-botao { display: inline-block; }
  #menu[hidden] { display: none; }
  #menu ul { flex-direction: column; }
}

.hero { text-align: center; padding: clamp(3rem, 10vw, 7rem) 1rem; }
.hero h1 { font-size: clamp(1.75rem, 1.2rem + 3vw, 3.25rem); margin: 0 0 1rem; }
.botao { display: inline-block; background: var(--primaria); color: #fff; padding: .75rem 1.25rem; border: 0; border-radius: .5rem; text-decoration: none; font: inherit; cursor: pointer; }
.botao:hover { filter: brightness(1.1); }

.grade { display: grid; gap: 1rem; grid-template-columns: repeat(auto-fit, minmax(14rem, 1fr)); }
.card { background: var(--card); border: 1px solid var(--borda); border-radius: .75rem; padding: 1.25rem; }

form { display: grid; gap: .5rem; max-width: 30rem; }
input { padding: .6rem; border: 1px solid var(--borda); border-radius: .4rem; font: inherit; background: var(--fundo); color: inherit; }
input[aria-invalid="true"] { border-color: #d1242f; }
.erro { color: #d1242f; margin: 0; min-height: 1.2em; font-size: .9rem; }

@media (prefers-reduced-motion: reduce) { * { animation: none !important; transition: none !important; } }
```

Observação: `#d1242f` sobre fundo branco tem contraste adequado; confirme na DevTools para o tema escuro.

## `script.js`

```js
const botao = document.querySelector("#menu-botao");
const menu = document.querySelector("#menu");

function ajustarMenu() {
  const estreito = window.matchMedia("(max-width: 40em)").matches;
  menu.hidden = estreito;
  botao.setAttribute("aria-expanded", "false");
}
ajustarMenu();
window.matchMedia("(max-width: 40em)").addEventListener("change", ajustarMenu);

botao.addEventListener("click", () => {
  const aberto = botao.getAttribute("aria-expanded") === "true";
  botao.setAttribute("aria-expanded", String(!aberto));
  menu.hidden = aberto;
});

const form = document.querySelector("#form");
form.addEventListener("submit", (e) => {
  e.preventDefault();
  let valido = true;
  for (const campo of form.elements) {
    if (!campo.willValidate) continue;
    const erro = document.querySelector(`#erro-${campo.name}`);
    if (!campo.checkValidity()) {
      valido = false;
      campo.setAttribute("aria-invalid", "true");
      erro.textContent = campo.validationMessage;
    } else {
      campo.removeAttribute("aria-invalid");
      erro.textContent = "";
    }
  }
  document.querySelector("#status").textContent = valido
    ? "Inscrição enviada (simulação)."
    : "Corrija os campos destacados.";
});
```

## Checklist de entrega

- [ ] HTML válido (validator.w3.org).
- [ ] Navegação 100% por teclado, com foco visível.
- [ ] Lighthouse com Acessibilidade ≥ 90.
- [ ] Testado em 360, 768 e 1280 px.
- [ ] Contraste AA nos dois temas.
- [ ] Sem bibliotecas externas.

## Critérios de correção

| Critério | O que observar |
|---|---|
| Semântica | uso de `header`, `main`, `section`, `footer`, títulos em ordem |
| Responsividade | sem rolagem horizontal; layout se adapta |
| Acessibilidade | rótulos, foco, contraste, `aria-live` |
| Código | organizado, sem duplicação, comentado onde necessário |

## Desafio extra

Adicione uma seção de FAQ com `<details>`/`<summary>`, um botão de alternância manual de tema salvo em `localStorage` e uma animação sutil que respeite `prefers-reduced-motion`.

## Referências

- [MDN — Aprenda desenvolvimento web](https://developer.mozilla.org/pt-BR/docs/Learn_web_development)
- [web.dev Learn](https://web.dev/learn)
