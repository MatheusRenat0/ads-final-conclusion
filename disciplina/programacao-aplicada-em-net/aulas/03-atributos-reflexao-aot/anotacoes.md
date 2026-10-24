# Minhas anotações: Atributos, reflexão e geração de código

## Atributos

Atributos associam metadados a classes, métodos, propriedades e outros elementos do programa. Eles não executam automaticamente a regra descrita; uma ferramenta ou parte da aplicação precisa ler o metadado e decidir como usá-lo.

```csharp
[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
public sealed class RequerPermissaoAttribute(string nome) : Attribute
{
    public string Nome { get; } = nome;
}

[RequerPermissao("Pedidos.Editar")]
public class PedidoService { }
```

O atributo registra uma informação associada à classe. Frameworks usam atributos para configuração e integração, por exemplo em APIs, validação, serialização e mapeamento de dados.

## Reflexão

`System.Reflection` permite inspecionar tipos, métodos e atributos durante a execução. Isso é útil para frameworks, ferramentas de diagnóstico e cenários em que a estrutura só é conhecida em runtime. Porém, reflexão pode tornar o fluxo menos explícito e trazer custo de execução. Também pode dificultar trimming e publicação AOT quando o programa depende de tipos que só são descobertos dinamicamente.

```csharp
var tipo = typeof(PedidoService);
var requisito = tipo.GetCustomAttributes(typeof(RequerPermissaoAttribute), inherit: true)
    .Cast<RequerPermissaoAttribute>()
    .SingleOrDefault();

Console.WriteLine(requisito?.Nome);
```

O exemplo lê o metadado em runtime. Em código de aplicação, é importante limitar esse mecanismo a uma necessidade clara e evitar espalhar descoberta dinâmica por toda parte.

## JIT, AOT e trimming

Com JIT, partes do programa podem ser compiladas durante a execução. AOT produz código nativo antes de executar; trimming remove código considerado não utilizado. Recursos dinâmicos, como reflexão sem anotações ou referências explícitas, podem dificultar que a ferramenta saiba quais tipos precisam permanecer.

Não existe uma regra de que reflexão seja sempre proibida ou AOT sempre melhor. É preciso considerar inicialização, distribuição, compatibilidade das bibliotecas e requisitos do sistema, e então publicar e validar a aplicação no modo desejado.

## Source generators

Source generators analisam o projeto durante a compilação e produzem código-fonte adicional. Em alguns cenários, como serialização JSON, a geração reduz dependência de descoberta dinâmica e pode facilitar publicação com trimming ou AOT. O código gerado continua precisando ser entendido e validado.

## Decisão prática

Antes de usar reflexão, identifico qual informação não consigo conhecer de forma estática. Se o conjunto de tipos é conhecido na compilação, referências diretas ou geração de código podem deixar o comportamento mais previsível. Quando reflexão é adequada, mantenho seu uso localizado e verifico os avisos de publicação.

**Apresentação usada em sala de aula:** Pattern Matching, Atributos e Reflexão Controlada.
