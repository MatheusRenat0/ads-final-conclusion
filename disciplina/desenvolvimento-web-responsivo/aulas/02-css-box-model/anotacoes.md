# Minhas anotações: CSS, seletores, especificidade e box model

## Objetivos

- Aplicar CSS por arquivo externo.
- Usar seletores e entender especificidade, cascata e herança.
- Usar variáveis CSS (custom properties).

## Conteúdo

```html
<link rel="stylesheet" href="styles.css">
```

```css
h1 { color: #1a3d7c; font-size: 2rem; }
```

Uma regra é `seletor { propriedade: valor; }`.

### Seletores

| Seletor | Exemplo | Seleciona |
|---|---|---|
| tipo | `p` | todos os `<p>` |
| classe | `.card` | `class="card"` |
| id | `#topo` | `id="topo"` (use pouco) |
| descendente | `nav a` | `a` dentro de `nav` |
| filho | `ul > li` | filhos diretos |
| atributo | `input[type="email"]` | por atributo |
| pseudoclasse | `a:hover`, `li:nth-child(2)` | estados/posições |
| pseudoelemento | `p::first-line` | partes do elemento |
| `:is()`, `:where()` | `:is(h1,h2) a` | agrupamento |
| `:has()` | `.card:has(img)` | pai que contém algo |

### Cascata e especificidade

Quando regras conflitam, vence (em ordem): importância (`!important`), **especificidade**, ordem no código.

Especificidade (id, classe, tipo): `p` = 0-0-1; `.card` = 0-1-0; `#topo` = 1-0-0; `nav a.ativo` = 0-1-2. `:where()` tem especificidade zero.

```css
p { color: black; }          /* 0-0-1 */
.destaque { color: blue; }   /* 0-1-0 → vence */
```

Prefira classes e evite `!important` e seletores muito longos.

### Herança

Propriedades de texto (`color`, `font-family`) herdam; `border`, `margin` não.

### Unidades

`px` (fixo), `rem` (relativo à fonte da raiz), `em`, `%`, `vw/vh`, `ch`. Prefira `rem` para fontes, respeitando as preferências do usuário.

### Variáveis CSS

```css
:root {
  --cor-primaria: #1a3d7c;
  --espaco: 1rem;
}
.botao { background: var(--cor-primaria); padding: var(--espaco); color: white; }
```

### Cascade Layers

```css
@layer base, componentes;
@layer base { a { color: inherit; } }
@layer componentes { .botao { color: white; } }
```

Camadas posteriores vencem as anteriores, independentemente da especificidade.

### Exemplo

```css
.botao {
  display: inline-block;
  padding: .5rem 1rem;
  border-radius: .5rem;
  background: var(--cor-primaria);
  color: white;
  text-decoration: none;
}
.botao:hover, .botao:focus-visible { background: #0d2a5c; }
```

## Exercícios

1. Qual a especificidade de `ul li.ativo a`?
2. Dadas `.a { color: red }` e `p { color: blue }`, qual cor tem `<p class="a">`?
3. Por que `!important` deve ser evitado?
4. Defina duas variáveis de cor e use-as num botão e num título.

## Respostas comentadas

1. Uma classe (0-1-0) + três tipos `ul li a` = 0-1-3.
2. Vermelho: classe (0-1-0) vence tipo (0-0-1).
3. Torna a manutenção difícil: só outro `!important` mais específico o supera.
4. Declare em `:root` e use `var(--nome)`.

## Desafio

Crie uma "folha de estilo de tema" com variáveis para cores, espaçamentos e tipografia e aplique a uma página com cabeçalho, cartões e botões. Mude o tema alterando somente `:root`.

## Referências

- [MDN — Especificidade](https://developer.mozilla.org/pt-BR/docs/Web/CSS/Specificity)
- [MDN — Seletores CSS](https://developer.mozilla.org/pt-BR/docs/Web/CSS/CSS_selectors)
- [MDN — @layer](https://developer.mozilla.org/pt-BR/docs/Web/CSS/@layer)

---

## Parte 2: Box model e organização de estilos

### Objetivos

- Compreender o modelo de caixa.
- Controlar tamanho, espaçamento e posicionamento.
- Organizar CSS de forma sustentável (convenção BEM).

### Conteúdo

Todo elemento é uma caixa: **content → padding → border → margin**.

```css
*, *::before, *::after { box-sizing: border-box; }

.card {
  width: 20rem;
  padding: 1rem;
  border: 1px solid #ccc;
  margin: 1rem auto;   /* centraliza horizontalmente */
}
```

Com `box-sizing: border-box`, `width` já inclui padding e borda (cálculo mais intuitivo; é a recomendação padrão).

#### Margem

As margens verticais de elementos em bloco podem *colapsar* (a maior vence). Use `gap` em Flex/Grid para evitar surpresas.

#### Display

| Valor | Efeito |
|---|---|
| `block` | ocupa a linha inteira |
| `inline` | acompanha o texto; ignora largura/altura |
| `inline-block` | em linha, mas aceita dimensões |
| `none` | remove do layout |
| `flex`, `grid` | contêineres de layout (aula 05) |

#### Posicionamento

```css
.pai { position: relative; }
.selo { position: absolute; top: .5rem; right: .5rem; }
.cabecalho { position: sticky; top: 0; }
```

`static` (padrão), `relative`, `absolute`, `fixed`, `sticky`. Use `z-index` para sobreposição.

#### Tipografia e cores

```css
body { font-family: system-ui, sans-serif; line-height: 1.6; }
img { max-width: 100%; height: auto; display: block; }
```

#### Organizando estilos

Convenção **BEM** (Bloco, Elemento, Modificador):

```html
<article class="card card--destaque">
  <h2 class="card__titulo">Título</h2>
</article>
```

```css
.card { }
.card__titulo { }
.card--destaque { border-color: gold; }
```

Ordem sugerida no arquivo: variáveis → reset → base (tags) → layout → componentes → utilitários.

#### Aninhamento nativo (CSS Nesting)

```css
.card {
  padding: 1rem;
  & .card__titulo { font-size: 1.25rem; }
  &:hover { box-shadow: 0 2px 8px #0003; }
}
```

### Exercícios

1. Uma caixa tem `width: 200px; padding: 20px; border: 5px` com `content-box`. Qual a largura total? E com `border-box`?
2. Como centralizar um bloco horizontalmente?
3. Por que `img` costuma receber `max-width: 100%`?
4. Nomeie em BEM um botão de ícone dentro de um cabeçalho.

### Respostas comentadas

1. `content-box`: 200 + 40 + 10 = 250px. `border-box`: 200px.
2. Largura definida + `margin-inline: auto`.
3. Para que a imagem nunca exceda o contêiner, reduzindo-se proporcionalmente.
4. Ex.: `.cabecalho__botao-icone`.

### Desafio

Construa um cartão de produto (imagem, título, preço, botão) com BEM, `border-box`, sombra e um selo "novo" posicionado no canto.

### Referências

- [MDN — Box model](https://developer.mozilla.org/pt-BR/docs/Learn_web_development/Core/Styling_basics/Box_model)
- [BEM](https://getbem.com/introduction/)
