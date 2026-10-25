# Minhas anotações: Fundamentos de JavaScript, DOM e eventos

## Objetivos

- Declarar variáveis, usar tipos, funções, arrays e objetos.
- Escrever JavaScript moderno (ES2015+).

## Conteúdo

Inclua o script no final do `body` ou use `defer`:

```html
<script src="script.js" defer></script>
```

### Variáveis e tipos

```js
const nome = "Ana";       // não reatribuível
let contador = 0;         // reatribuível
contador += 1;
// evite var

console.log(typeof 42, typeof "a", typeof true, typeof undefined, typeof null);
```

Tipos primitivos: `string`, `number`, `boolean`, `undefined`, `null`, `bigint`, `symbol`. Objetos incluem arrays e funções.

### Igualdade

Use `===` e `!==` (sem coerção). `0 == "0"` é `true`, mas `0 === "0"` é `false`.

### Funções

```js
function somar(a, b) { return a + b; }
const dobro = (n) => n * 2;
const saudar = (nome = "visitante") => `Olá, ${nome}!`;
```

### Arrays e métodos funcionais

```js
const notas = [7, 5, 9, 4];
const aprovadas = notas.filter((n) => n >= 6);   // [7, 9]
const ajustadas = notas.map((n) => n + 1);
const media = notas.reduce((a, n) => a + n, 0) / notas.length;
notas.forEach((n, i) => console.log(i, n));
```

### Objetos

```js
const aluno = { nome: "Ana", notas: [8, 9] };
aluno.curso = "ADS";
const { nome, curso } = aluno;               // desestruturação
const copia = { ...aluno, nome: "Bia" };     // spread
```

### Condicionais e laços

```js
if (media >= 6) console.log("Aprovado");
else console.log("Reprovado");

for (const n of notas) console.log(n);
```

### Tratamento de erros

```js
try {
  const dados = JSON.parse('{"a": 1');   // JSON inválido
} catch (erro) {
  console.error("Falha ao ler JSON:", erro.message);
}
```

### Módulos

```js
// util.js
export const dobrar = (n) => n * 2;
// script.js
import { dobrar } from "./util.js";
```

Em HTML: `<script type="module" src="script.js"></script>`.

## Exercícios

1. Retorne a soma dos pares de um array.
2. Converta `["ana","bia"]` em `["Ana","Bia"]`.
3. Qual o resultado de `"5" + 3` e `"5" - 3`?
4. Use `reduce` para achar o maior valor de um array.

## Respostas comentadas

1. `arr.filter(n => n % 2 === 0).reduce((a, n) => a + n, 0)`.
2. `nomes.map(n => n[0].toUpperCase() + n.slice(1))`.
3. `"53"` (concatenação) e `2` (conversão numérica).
4. `arr.reduce((m, n) => (n > m ? n : m), arr[0])` ou `Math.max(...arr)`.

## Desafio

Crie um módulo `estatistica.js` exportando `media`, `mediana` e `moda`, e um `script.js` que os importa e imprime o resultado de um array no console.

## Referências

- [MDN — JavaScript](https://developer.mozilla.org/pt-BR/docs/Learn_web_development/Core/Scripting)
- [MDN — Referência JavaScript](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference)

---

## Parte 2: Manipulação do DOM e eventos

### Objetivos

- Selecionar e alterar elementos do DOM.
- Tratar eventos e usar delegação.
- Persistir dados simples com `localStorage`.

### Conteúdo

O **DOM** é a representação em árvore do documento que o JavaScript pode ler e alterar.

#### Selecionar

```js
const titulo = document.querySelector("h1");
const itens = document.querySelectorAll(".item");   // NodeList
```

#### Alterar

```js
titulo.textContent = "Novo título";        // texto seguro
elemento.classList.toggle("ativo");
elemento.setAttribute("aria-expanded", "true");
elemento.dataset.id = "42";                // data-id="42"
```

Evite `innerHTML` com dados do usuário (risco de XSS); prefira `textContent` ou `createElement`.

#### Criar e inserir

```js
const li = document.createElement("li");
li.textContent = "Nova tarefa";
document.querySelector("#lista").append(li);
```

#### Eventos

```js
const botao = document.querySelector("#botao");
botao.addEventListener("click", (evento) => {
  console.log("clicou", evento.target);
});
```

Eventos comuns: `click`, `input`, `change`, `submit`, `keydown`, `DOMContentLoaded`.

#### Delegação de eventos

```js
document.querySelector("#lista").addEventListener("click", (e) => {
  const item = e.target.closest("li");
  if (item) item.classList.toggle("feito");
});
```

Um só *listener* atende itens criados dinamicamente.

#### Exemplo: menu responsivo acessível

```html
<button id="menu-botao" aria-expanded="false" aria-controls="menu">Menu</button>
<nav id="menu" hidden>...</nav>
```

```js
const botao = document.querySelector("#menu-botao");
const menu = document.querySelector("#menu");
botao.addEventListener("click", () => {
  const aberto = botao.getAttribute("aria-expanded") === "true";
  botao.setAttribute("aria-expanded", String(!aberto));
  menu.hidden = aberto;
});
```

#### Exemplo: lista de tarefas com `localStorage`

```js
const chave = "tarefas";
const tarefas = JSON.parse(localStorage.getItem(chave) ?? "[]");

function salvar() { localStorage.setItem(chave, JSON.stringify(tarefas)); }
function renderizar() {
  const lista = document.querySelector("#lista");
  lista.replaceChildren(...tarefas.map((t) => {
    const li = document.createElement("li");
    li.textContent = t;
    return li;
  }));
}

document.querySelector("#form").addEventListener("submit", (e) => {
  e.preventDefault();
  const campo = e.target.elements.tarefa;
  if (campo.value.trim()) { tarefas.push(campo.value.trim()); salvar(); renderizar(); campo.value = ""; }
});
renderizar();
```

### Exercícios

1. Troque o texto de um parágrafo ao clicar num botão.
2. Alterne o tema escuro adicionando uma classe ao `body`.
3. Por que usar `textContent` em vez de `innerHTML` ao exibir texto digitado?
4. Para que serve `preventDefault()` num `submit`?

### Respostas comentadas

1. `botao.addEventListener("click", () => p.textContent = "Mudou")`.
2. `document.body.classList.toggle("escuro")`.
3. `innerHTML` interpreta HTML, permitindo injetar scripts (XSS); `textContent` trata como texto.
4. Impede o envio/recarregamento padrão para que o JS processe o formulário.

### Desafio

Evolua a lista de tarefas: marcar como concluída, remover, filtrar (todas/ativas/concluídas) e manter tudo no `localStorage`, com botões acessíveis por teclado.

### Referências

- [MDN — Manipulando documentos](https://developer.mozilla.org/pt-BR/docs/Learn_web_development/Core/Scripting/DOM_scripting)
- [MDN — Eventos](https://developer.mozilla.org/pt-BR/docs/Learn_web_development/Core/Scripting/Events)
