# Minhas anotações: Pattern matching em C#

Pattern matching é uma forma de comparar um valor com um padrão e, quando necessário, extrair dados dele. Ele ajuda a escrever regras de decisão próximas do domínio da aplicação. Não é só um `switch` com outra sintaxe: os padrões também verificam tipos, propriedades, valores constantes e relações lógicas.

## `is` com tipo e variável

```csharp
if (valor is string texto && texto.Length > 0)
{
    Console.WriteLine(texto);
}
```

A expressão verifica se `valor` é uma string e disponibiliza a variável `texto` no escopo em que a condição é verdadeira.

## `switch` expression

```csharp
static string Classificar(int codigo) => codigo switch
{
    200 => "Sucesso",
    400 or 422 => "Requisição inválida",
    >= 500 => "Erro no servidor",
    _ => "Outro resultado"
};
```

O `_` representa o caso geral. A expressão retorna um valor, então funciona bem quando cada alternativa produz um resultado. As condições devem ser organizadas para evitar padrões inalcançáveis; o compilador aponta alguns desses problemas.

## Padrões de propriedade e composição

```csharp
if (pedido is { Status: "Pago", Total: > 0 })
{
    Console.WriteLine("Pedido pago com valor positivo");
}
```

Também é possível combinar padrões com `and`, `or` e `not`. Isso permite representar regras como “status pago ou enviado” sem abrir vários blocos aninhados.

## Exemplo de domínio

Ao processar uma resposta de pagamento, posso separar sucesso, recusa e erro temporário por tipo e propriedades. A regra fica explícita e mais fácil de revisar. Se as decisões ficarem muito extensas, vale extrair métodos com nomes que expliquem cada regra.

## Cuidados

- Evitar um `switch` gigante que mistura regra de negócio, acesso a dados e efeitos externos.
- Garantir que os casos importantes estejam cobertos e que o caso padrão faça sentido.
- Preferir tipos que expressem bem o domínio, em vez de depender de strings mágicas espalhadas pelo código.
- Lembrar que pattern matching organiza decisões, mas não substitui testes das regras.

**Apresentação usada em sala de aula:** Pattern Matching, Atributos e Reflexão Controlada.
