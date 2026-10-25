# Minhas anotações: Flexbox e CSS Grid

## Objetivos

- Construir layouts unidimensionais com Flexbox.
- Construir layouts bidimensionais com Grid.
- Escolher a ferramenta adequada.

## Conteúdo

### Flexbox (uma dimensão)

```css
.barra {
  display: flex;
  justify-content: space-between; /* eixo principal */
  align-items: center;            /* eixo transversal */
  gap: 1rem;
  flex-wrap: wrap;
}
.barra__busca { flex: 1; }   /* ocupa o espaço restante */
```

| Propriedade | Função |
|---|---|
| `flex-direction` | `row` (padrão) ou `column` |
| `justify-content` | distribuição no eixo principal |
| `align-items` | alinhamento no eixo transversal |
| `flex: 1` | crescer para preencher |
| `flex-wrap` | permite quebra de linha |

Centralizar tudo:

```css
.centro { display: grid; place-items: center; min-height: 100vh; }
```

### CSS Grid (duas dimensões)

```css
.galeria {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(12rem, 1fr));
  gap: 1rem;
}
```

Esta linha cria colunas que se ajustam à largura disponível **sem media queries**.

Áreas nomeadas:

```css
.pagina {
  display: grid;
  grid-template-columns: 15rem 1fr;
  grid-template-areas:
    "topo  topo"
    "menu  conteudo"
    "rodape rodape";
  gap: 1rem;
}
.topo { grid-area: topo; }
.menu { grid-area: menu; }
.conteudo { grid-area: conteudo; }
.rodape { grid-area: rodape; }
```

Unidade `fr`: fração do espaço livre. Use `grid-column: span 2` para ocupar várias colunas.

### Quando usar

- **Flexbox**: barras, menus, alinhamento de itens em uma linha ou coluna.
- **Grid**: estrutura de página, galerias, formulários em colunas.
- Combine: Grid para a página, Flex dentro dos componentes.

### Exemplo completo: cards

```html
<section class="cards">
  <article class="card"><h3>Um</h3><p>Texto.</p></article>
  <article class="card"><h3>Dois</h3><p>Texto.</p></article>
  <article class="card"><h3>Três</h3><p>Texto.</p></article>
</section>
```

```css
.cards { display: grid; gap: 1rem; grid-template-columns: repeat(auto-fit, minmax(14rem, 1fr)); }
.card { border: 1px solid #ddd; border-radius: .5rem; padding: 1rem; }
```

## Exercícios

1. Faça uma barra de navegação com logo à esquerda e links à direita.
2. Crie um layout de três colunas iguais com Grid.
3. Qual a diferença entre `auto-fill` e `auto-fit`?
4. Reproduza o layout "topo, menu, conteúdo, rodapé" com áreas nomeadas.

## Respostas comentadas

1. `display:flex; justify-content:space-between; align-items:center` no `nav`.
2. `grid-template-columns: repeat(3, 1fr)`.
3. `auto-fill` mantém trilhas vazias; `auto-fit` as colapsa, esticando os itens existentes.
4. Veja o exemplo de áreas nomeadas acima.

## Desafio

Faça uma galeria de 12 imagens responsiva (1 coluna no celular, até 4 no desktop) sem usar media queries, e uma barra de ferramentas Flex com botões que quebram de linha em telas estreitas.

## Referências

- [MDN — Flexbox](https://developer.mozilla.org/pt-BR/docs/Learn_web_development/Core/CSS_layout/Flexbox)
- [MDN — Grid](https://developer.mozilla.org/pt-BR/docs/Learn_web_development/Core/CSS_layout/Grids)
