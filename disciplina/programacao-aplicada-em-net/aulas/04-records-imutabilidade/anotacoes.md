# Minhas anotações: Records e imutabilidade

Um `record` é um tipo apropriado para representar dados. Diferente de uma classe tradicional, records fornecem igualdade baseada nos valores dos membros, o que ajuda quando duas instâncias representam a mesma informação. Classes continuam sendo uma boa escolha para objetos cuja identidade e ciclo de vida importam.

## Record posicional

```csharp
public record Endereco(string Cidade, string Estado);

var primeiro = new Endereco("Santos", "SP");
var segundo = new Endereco("Santos", "SP");

Console.WriteLine(primeiro == segundo); // True
```

No exemplo, os objetos são instâncias diferentes, mas têm os mesmos valores e são comparados como iguais. Essa igualdade por valor é útil para mensagens, resultados e dados de transporte.

## Imutabilidade

Imutabilidade significa que, depois de criado, o valor não é alterado por uma atribuição posterior aos mesmos membros. Com isso fica mais fácil entender onde uma mudança aconteceu, especialmente ao compartilhar dados entre partes do programa.

O modificador `init` permite inicializar uma propriedade durante a criação do objeto:

```csharp
public record Produto
{
    public required string Nome { get; init; }
    public decimal Preco { get; init; }
}
```

`required` exige que o valor seja informado na inicialização. Isso melhora a segurança do modelo, embora regras adicionais ainda possam ser necessárias para validar os dados.

## Cópia com `with`

```csharp
var atual = new Produto { Nome = "Caderno", Preco = 18m };
var promocional = atual with { Preco = 15m };
```

`with` cria uma nova instância com uma ou mais propriedades substituídas. Não altera o objeto original. Essa cópia é superficial; se houver uma propriedade que aponta para uma coleção mutável, essa coleção pode continuar compartilhada.

## Quando usar

Uso records para valores, eventos, resultados e modelos de transporte. Para entidades de domínio que têm identidade própria ou precisam preservar invariantes por métodos, uma classe pode representar melhor o comportamento. O tipo deve refletir como o dado é usado, não apenas uma preferência de sintaxe.

**Apresentação usada em sala de aula:** Records, Imutabilidade Funcional e Mapeamentos DTO.
