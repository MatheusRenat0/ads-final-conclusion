# Minhas anotações: Formulários e validação no frontend

## Objetivos

- Construir formulários acessíveis.
- Usar a validação nativa e personalizá-la com JavaScript.
- Entender que a validação no cliente não substitui a do servidor.

## Conteúdo

```html
<form id="cadastro" novalidate>
  <div>
    <label for="nome">Nome completo</label>
    <input id="nome" name="nome" required minlength="3" autocomplete="name">
    <p class="erro" id="erro-nome" role="alert"></p>
  </div>
  <div>
    <label for="email">E-mail</label>
    <input id="email" name="email" type="email" required autocomplete="email">
    <p class="erro" id="erro-email" role="alert"></p>
  </div>
  <div>
    <label for="idade">Idade</label>
    <input id="idade" name="idade" type="number" min="16" max="120">
  </div>
  <fieldset>
    <legend>Interesse</legend>
    <label><input type="radio" name="area" value="web" checked> Web</label>
    <label><input type="radio" name="area" value="dados"> Dados</label>
  </fieldset>
  <label><input type="checkbox" name="termos" required> Aceito os termos</label>
  <button type="submit">Enviar</button>
</form>
```

### Boas práticas

- Todo campo tem um `label` associado (`for`/`id`).
- Use o `type` correto (`email`, `tel`, `number`, `date`, `password`) e `autocomplete`.
- Agrupe opções com `fieldset` + `legend`.
- Mensagens de erro claras, perto do campo e anunciadas (`role="alert"` ou `aria-live`).

### Atributos de validação nativa

`required`, `minlength`, `maxlength`, `min`, `max`, `pattern`, `type`.

### Constraint Validation API

```js
const form = document.querySelector("#cadastro");

form.addEventListener("submit", (e) => {
  let valido = true;
  for (const campo of form.elements) {
    if (!campo.willValidate) continue;
    const erro = document.querySelector(`#erro-${campo.name}`);
    campo.setCustomValidity("");
    if (campo.name === "nome" && campo.value.trim().split(" ").length < 2) {
      campo.setCustomValidity("Informe nome e sobrenome.");
    }
    if (!campo.checkValidity()) {
      valido = false;
      if (erro) erro.textContent = campo.validationMessage;
      campo.setAttribute("aria-invalid", "true");
    } else {
      if (erro) erro.textContent = "";
      campo.removeAttribute("aria-invalid");
    }
  }
  if (!valido) e.preventDefault();
  else { e.preventDefault(); console.log(Object.fromEntries(new FormData(form))); }
});
```

### Estilizando estados

```css
input:user-invalid { border-color: #b00020; }
input:user-valid { border-color: #1b7f3b; }
```

### Segurança

A validação no navegador melhora a experiência, mas pode ser contornada. **Sempre valide novamente no servidor**, e nunca confie em dados do cliente. Evite `pattern` complexo para e-mails: o `type="email"` é suficiente.

## Exercícios

1. Adicione um campo CEP com `pattern="\d{5}-?\d{3}"`.
2. Faça o botão ficar desabilitado até o formulário ser válido.
3. Mostre um contador de caracteres para um `textarea` com `maxlength`.
4. Por que não confiar só na validação do frontend?

## Respostas comentadas

1. `<input name="cep" inputmode="numeric" pattern="\d{5}-?\d{3}" title="Formato 00000-000">`.
2. Em `input`, execute `botao.disabled = !form.checkValidity()`.
3. No evento `input` do campo, atualize `contador.textContent = campo.value.length`.
4. Qualquer pessoa pode alterar o HTML/JS ou enviar requisições diretas ao servidor.

## Desafio

Crie um formulário de inscrição com máscara de telefone simples, confirmação de senha (as duas devem ser iguais), exibição das mensagens de erro acessíveis e envio dos dados como JSON no console.

## Referências

- [MDN — Validação de formulários](https://developer.mozilla.org/pt-BR/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [web.dev — Forms](https://web.dev/learn/forms)
