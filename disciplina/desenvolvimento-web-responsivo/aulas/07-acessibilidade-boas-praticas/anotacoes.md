# Minhas anotações: Acessibilidade, usabilidade e boas práticas

## Objetivos

- Conhecer os princípios da WCAG (POUR).
- Aplicar semântica, teclado, foco, contraste e ARIA.
- Avaliar acessibilidade com ferramentas.

## Conteúdo

A **acessibilidade** garante que pessoas com diferentes capacidades (visuais, auditivas, motoras, cognitivas) usem o site. A referência é a [WCAG 2.2](https://www.w3.org/TR/WCAG22/), organizada nos princípios **POUR**: Perceptível, Operável, Compreensível, Robusto.

### Checklist essencial

1. **HTML semântico** (a base de tudo; ARIA é complemento).
2. **Texto alternativo** em imagens informativas.
3. **Contraste**: mínimo 4,5:1 para texto normal e 3:1 para texto grande (nível AA).
4. **Teclado**: tudo operável por `Tab`, `Enter`, `Espaço`, `Esc`; ordem lógica.
5. **Foco visível**.
6. **Rótulos** em formulários e mensagens de erro claras.
7. **Não depender só de cor** para transmitir informação.
8. **Alvos de toque** com tamanho suficiente (a WCAG 2.2 pede ao menos 24×24 px no AA).
9. **Respeitar preferências** (movimento reduzido, tamanho de fonte).

### Foco e teclado

```css
:focus-visible { outline: 3px solid #1a73e8; outline-offset: 2px; }
```

Nunca remova `outline` sem substituto. Use `button` para ações e `a` para navegação, e não `div` clicável.

### Link "pular para o conteúdo"

```html
<a class="pular" href="#conteudo">Pular para o conteúdo</a>
<main id="conteudo" tabindex="-1">...</main>
```

```css
.pular { position: absolute; left: -999px; }
.pular:focus { left: 1rem; top: 1rem; background: #fff; padding: .5rem; }
```

### ARIA: regras de ouro

1. Se existe elemento HTML nativo, use-o.
2. Não altere a semântica nativa sem necessidade.
3. Todo controle ARIA interativo deve funcionar por teclado.

Exemplos úteis: `aria-label` (nome acessível), `aria-expanded`, `aria-controls`, `aria-live="polite"` (anúncios), `aria-current="page"`.

```html
<nav aria-label="Principal">
  <a href="/" aria-current="page">Início</a>
</nav>
<p aria-live="polite" id="status"></p>
```

### Usabilidade

Hierarquia visual clara, consistência, feedback de ações, mensagens de erro que dizem como corrigir, textos legíveis (linhas de ~60–75 caracteres) e navegação previsível. As 10 heurísticas de Nielsen são um bom roteiro de avaliação.

### Ferramentas

- Lighthouse e o painel de Acessibilidade das DevTools.
- Verificação de contraste das DevTools.
- Leitores de tela: NVDA (Windows, gratuito), VoiceOver (macOS/iOS), TalkBack (Android).
- Teste manual: navegue só com o teclado.

## Exercícios

1. Qual a razão de contraste mínima (AA) para texto normal?
2. Corrija: `<div onclick="abrir()">Abrir</div>`.
3. Escreva `alt` para uma foto decorativa e para o logotipo que é link para a home.
4. Por que "clique aqui" é um texto de link ruim?

## Respostas comentadas

1. 4,5:1.
2. `<button type="button" id="abrir">Abrir</button>`, com o evento ligado via JS. O botão nativo ganha foco e teclado.
3. Decorativa: `alt=""`. Logo-link: `alt="Página inicial – NomeDaEmpresa"` (descreve o destino).
4. Leitores de tela listam links isoladamente; "clique aqui" não diz o destino.

## Desafio

Audite uma página sua com Lighthouse e uma navegação só por teclado. Liste cinco problemas, corrija e compare as pontuações antes/depois.

## Referências

- [W3C WAI — WCAG 2 Overview](https://www.w3.org/WAI/standards-guidelines/wcag/)
- [MDN — Acessibilidade](https://developer.mozilla.org/pt-BR/docs/Learn_web_development/Core/Accessibility)
- [WAI-ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/)

---

## Parte 2: Organização de arquivos e boas práticas

### Objetivos

- Estruturar um projeto web estático.
- Aplicar boas práticas de desempenho, segurança e versionamento.

### Conteúdo

#### Estrutura sugerida

```text
meu-site/
├── index.html
├── sobre.html
├── css/
│   ├── base.css
│   ├── layout.css
│   └── componentes.css
├── js/
│   ├── main.js
│   └── modulos/
├── img/
└── README.md
```

Nomes de arquivos em minúsculas, sem espaços nem acentos (`foto-equipe.jpg`).

#### Boas práticas de código

- Separe estrutura, estilo e comportamento (sem `style=""` e `onclick=""` inline).
- Use `<link>` para CSS no `head` e `defer` ou `type="module"` para JS.
- Comente o *porquê*, não o óbvio; mantenha identação consistente.
- Evite duplicação com variáveis CSS e funções.

#### Desempenho

- Otimize imagens (formatos WebP/AVIF quando suportados; dimensões corretas; `loading="lazy"` abaixo da dobra).
- Minimize CSS/JS em produção e use cache.
- Evite bloquear a renderização com scripts no `head` sem `defer`.
- Meça com Lighthouse (Core Web Vitals: LCP, INP, CLS).

#### SEO básico

`title` e `meta description` únicos, hierarquia de títulos, `alt` nas imagens, URLs legíveis e `lang` correto.

#### Segurança no frontend

- Sirva por HTTPS.
- Não coloque segredos (chaves, senhas) no código do cliente.
- Evite `innerHTML` com dados externos; links externos com `rel="noopener noreferrer"` quando usar `target="_blank"`.
- Para sites de produção, configure cabeçalhos como `Content-Security-Policy` no servidor.

#### Compatibilidade

Consulte [Can I use](https://caniuse.com/) e o MDN antes de depender de recursos novos; use *progressive enhancement* (o básico funciona em qualquer navegador, os recursos modernos aprimoram).

```css
@supports (display: grid) { .layout { display: grid; } }
```

#### Versionamento

```text
git init
git add .
git commit -m "feat: página inicial"
```

Adicione `README.md` com instruções e use `.gitignore`.

### Exercícios

1. Reorganize uma página com CSS e JS inline em arquivos separados.
2. Escreva um `title` e uma `meta description` adequados para uma página "Contato".
3. Por que `defer` é preferível a colocar o script no `head` sem atributos?
4. Que problema há em guardar uma chave de API no JavaScript do cliente?

### Respostas comentadas

1. Mova `<style>` para `css/base.css` e `<script>` para `js/main.js`, referenciando-os.
2. Ex.: `<title>Contato | Meu Site</title>`; descrição de ~150 caracteres.
3. `defer` baixa o script em paralelo e executa depois do HTML ser analisado, sem bloquear a renderização.
4. Qualquer visitante pode ver e usar a chave; segredos devem ficar no servidor.

### Desafio

Pegue um site pequeno seu, aplique a estrutura sugerida, rode o Lighthouse, melhore pelo menos duas métricas e documente as mudanças no README.

### Referências

- [web.dev — Performance](https://web.dev/learn/performance)
- [MDN — Segurança na Web](https://developer.mozilla.org/pt-BR/docs/Web/Security)
- [Can I use](https://caniuse.com/)
