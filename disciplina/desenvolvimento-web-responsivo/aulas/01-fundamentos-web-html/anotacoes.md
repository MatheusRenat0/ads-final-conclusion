# Minhas anotações: Fundamentos da Web e HTML semântico

## Objetivos

- Explicar o modelo cliente-servidor e o ciclo requisição/resposta HTTP.
- Diferenciar HTML, CSS e JavaScript.
- Criar e abrir uma primeira página.

## Conteúdo

A **Internet** é a rede de redes; a **Web** é um serviço sobre ela, formado por recursos identificados por **URLs** e transferidos por **HTTP/HTTPS**.

```text
Navegador (cliente)  --- GET /index.html --->  Servidor
                     <-- 200 OK + HTML -----
```

Partes de uma URL: `https://exemplo.com:443/cursos/ads?ordem=nome#topo` → protocolo, host, porta, caminho, consulta (query) e fragmento.

### Métodos e códigos HTTP comuns

| Método | Uso típico |
|---|---|
| GET | obter um recurso |
| POST | enviar dados / criar |
| PUT / PATCH | substituir / alterar |
| DELETE | remover |

| Código | Significado |
|---|---|
| 200 | OK |
| 301/302 | redirecionamento |
| 404 | não encontrado |
| 500 | erro no servidor |

Use **HTTPS** sempre: ele cifra a comunicação.

### Três linguagens, três papéis

- **HTML**: estrutura e significado do conteúdo.
- **CSS**: apresentação.
- **JavaScript**: comportamento.

### Primeira página

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Minha primeira página</title>
</head>
<body>
  <h1>Olá, Web!</h1>
  <p>Esta é minha primeira página.</p>
</body>
</html>
```

- `<!DOCTYPE html>` ativa o modo padrão.
- `lang` ajuda leitores de tela e tradutores.
- `viewport` é essencial para páginas responsivas em celulares.

### Ferramentas do desenvolvedor

Tecle `F12` no navegador: **Elements** (DOM e CSS), **Console** (erros e logs), **Network** (requisições), **Lighthouse** (qualidade e acessibilidade).

## Exercícios

1. Identifique protocolo, host e caminho em `https://developer.mozilla.org/pt-BR/docs/Web/HTML`.
2. O que significa um status 404? E 500?
3. Por que a tag `meta viewport` é importante?
4. Abra a aba Network em um site e identifique a requisição do documento HTML.

## Respostas comentadas

1. Protocolo `https`, host `developer.mozilla.org`, caminho `/pt-BR/docs/Web/HTML`.
2. 404: o recurso não existe (erro do cliente/URL). 500: falha interna do servidor.
3. Sem ela, navegadores móveis simulam uma tela larga e reduzem a página, quebrando o design responsivo.
4. Será a primeira linha do tipo "document", com método GET e status 200.

## Desafio

Crie uma página "Sobre mim" com título, parágrafo, lista dos seus interesses e um link para um site de referência. Valide-a em [validator.w3.org](https://validator.w3.org/).

## Referências

- [MDN — Como a Web funciona](https://developer.mozilla.org/pt-BR/docs/Learn_web_development/Getting_started/Web_standards/How_the_web_works)
- [MDN — HTTP](https://developer.mozilla.org/pt-BR/docs/Web/HTTP)

---

## Parte 2: Estrutura semântica com HTML

### Objetivos

- Usar elementos semânticos para dar significado ao conteúdo.
- Construir listas, tabelas, links e imagens corretamente.

### Conteúdo

**HTML semântico** descreve o *significado* do conteúdo, não só a aparência. Isso beneficia acessibilidade, SEO e manutenção.

#### Estrutura de página

```html
<body>
  <header>
    <h1>Blog de Tecnologia</h1>
    <nav aria-label="Principal">
      <ul>
        <li><a href="/">Início</a></li>
        <li><a href="/artigos">Artigos</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <article>
      <h2>Entendendo HTTP</h2>
      <p>Publicado em <time datetime="2026-03-10">10 de março de 2026</time>.</p>
      <section>
        <h3>Requisições</h3>
        <p>...</p>
      </section>
    </article>
    <aside>
      <h2>Relacionados</h2>
    </aside>
  </main>

  <footer><small>&copy; 2026 Blog</small></footer>
</body>
```

| Elemento | Uso |
|---|---|
| `header`, `footer` | cabeçalho/rodapé da página ou seção |
| `nav` | navegação principal |
| `main` | conteúdo principal (um por página) |
| `article` | conteúdo independente |
| `section` | agrupamento temático com título |
| `aside` | conteúdo complementar |

#### Títulos

Use `h1`…`h6` em ordem hierárquica, sem pular níveis, e um `h1` por página.

#### Texto, listas e links

```html
<p>Texto com <strong>importância</strong> e <em>ênfase</em>.</p>
<ol><li>Primeiro</li><li>Segundo</li></ol>
<a href="https://developer.mozilla.org/" target="_blank" rel="noopener noreferrer">MDN</a>
```

Textos de link devem fazer sentido sozinhos (evite "clique aqui").

#### Imagens

```html
<figure>
  <img src="img/campus.jpg" alt="Fachada do campus ao entardecer" width="800" height="450" loading="lazy">
  <figcaption>Campus principal.</figcaption>
</figure>
```

`alt` descreve a imagem (use `alt=""` se for decorativa). `width`/`height` evitam saltos de layout.

#### Tabelas (para dados tabulares, não para layout)

```html
<table>
  <caption>Notas do semestre</caption>
  <thead><tr><th scope="col">Disciplina</th><th scope="col">Nota</th></tr></thead>
  <tbody><tr><td>Web</td><td>9,0</td></tr></tbody>
</table>
```

#### Evite

`<div>` e `<span>` quando houver elemento semântico adequado; `<b>`/`<i>` apenas para estilo; tabelas para layout.

### Exercícios

1. Reescreva com tags semânticas: `<div class="topo"><div class="menu">...</div></div>`.
2. Qual a diferença entre `article` e `section`?
3. Escreva o `alt` adequado para um gráfico de vendas crescentes.
4. Crie uma tabela com 3 linhas de dados e legenda.

### Respostas comentadas

1. `<header><nav>...</nav></header>`.
2. `article` é autossuficiente (pode ser republicado isolado); `section` agrupa partes de um tema, geralmente com título.
3. Ex.: "Gráfico de barras mostrando vendas crescentes de janeiro a junho". Descreva a informação, não "imagem de".
4. Use `caption`, `thead` com `th scope="col"` e `tbody`.

### Desafio

Monte a página de um currículo com `header`, `main` (seções Formação, Experiência, Habilidades) e `footer`, sem nenhum `div`. Passe o HTML no [validador W3C](https://validator.w3.org/).

### Referências

- [MDN — Elementos HTML](https://developer.mozilla.org/pt-BR/docs/Web/HTML/Element)
- [web.dev — HTML semântico](https://web.dev/learn/html)
