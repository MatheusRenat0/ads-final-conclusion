# Minhas anotações: Design responsivo e media queries

## Objetivos

- Aplicar a abordagem *mobile first*.
- Usar media queries, unidades fluidas e `clamp()`.
- Servir imagens responsivas e conhecer container queries.

## Conteúdo

Design responsivo = layout fluido + imagens flexíveis + **media queries**, sobre a base da meta `viewport`.

### Mobile first

Escreva o CSS para telas pequenas e acrescente regras para telas maiores.

```css
.layout { display: grid; gap: 1rem; }

@media (min-width: 48em) {      /* ≈ 768px */
  .layout { grid-template-columns: 1fr 2fr; }
}
@media (min-width: 64em) {      /* ≈ 1024px */
  .layout { grid-template-columns: 1fr 3fr 1fr; }
}
```

Escolha breakpoints pelo conteúdo (onde o layout quebra), não por aparelhos específicos.

### Outras consultas úteis

```css
@media (prefers-color-scheme: dark) { :root { --fundo: #111; --texto: #eee; } }
@media (prefers-reduced-motion: reduce) { * { animation: none !important; transition: none !important; } }
@media print { nav, footer { display: none; } }
```

### Tipografia e espaçamento fluidos

```css
h1 { font-size: clamp(1.75rem, 1.2rem + 2vw, 3rem); }
.container { width: min(100% - 2rem, 70rem); margin-inline: auto; }
```

### Imagens responsivas

```html
<img src="foto-800.jpg"
     srcset="foto-400.jpg 400w, foto-800.jpg 800w, foto-1600.jpg 1600w"
     sizes="(min-width: 64em) 50vw, 100vw"
     alt="Equipe reunida" width="800" height="533" loading="lazy">
```

`<picture>` permite formatos alternativos ou *art direction*.

### Container queries

O componente responde ao tamanho do seu contêiner, não da tela:

```css
.coluna { container-type: inline-size; }
@container (min-width: 30em) {
  .card { display: grid; grid-template-columns: 10rem 1fr; }
}
```

### Testando

Use o modo dispositivo nas ferramentas do navegador, redimensione a janela, aumente o zoom e teste toque e teclado.

## Exercícios

1. Reescreva em mobile first: `@media (max-width: 600px) { .menu { display:block } }`.
2. Como evitar que a imagem ultrapasse a tela?
3. O que `clamp(1rem, 2vw, 2rem)` faz?
4. Para que serve `prefers-reduced-motion`?

## Respostas comentadas

1. Deixe `display:block` por padrão e use `@media (min-width: 37.5em) { .menu { display:flex } }`.
2. `img { max-width:100%; height:auto }`.
3. Valor fluido de 2vw, limitado entre 1rem e 2rem.
4. Respeita usuários que desativaram animações no sistema (acessibilidade vestibular).

## Desafio

Crie um site de uma página com menu hambúrguer simples (aula 08 completará com JS), grade de cards, imagens com `srcset` e tema escuro automático. Teste em 360, 768 e 1280 px.

## Referências

- [MDN — Design responsivo](https://developer.mozilla.org/pt-BR/docs/Learn_web_development/Core/CSS_layout/Responsive_design)
- [web.dev — Responsive design](https://web.dev/learn/design)
- [MDN — Container queries](https://developer.mozilla.org/pt-BR/docs/Web/CSS/CSS_containment/Container_queries)
