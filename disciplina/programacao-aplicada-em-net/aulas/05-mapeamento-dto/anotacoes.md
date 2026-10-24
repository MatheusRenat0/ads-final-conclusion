# Minhas anotações: DTOs e mapeamento

DTO significa Data Transfer Object. É um objeto que define os dados enviados entre partes de um sistema, como a API e seu cliente. O formato externo da API nem sempre deve ser igual ao modelo usado para persistir ou aplicar regras de negócio.

## Por que separar

Uma entidade de banco pode conter campos internos, relacionamentos e detalhes que não devem ser expostos. Um DTO permite escolher explicitamente o que entra e sai, além de manter o contrato da API mais estável mesmo quando a estrutura interna muda.

```csharp
public sealed record CriarClienteRequest(string Nome, string Email);
public sealed record ClienteResponse(int Id, string Nome, string Email);

public sealed class Cliente
{
    public int Id { get; set; }
    public string Nome { get; set; } = "";
    public string Email { get; set; } = "";
    public string HashSenha { get; set; } = "";
}
```

O `HashSenha` não pertence à resposta pública. O mapeamento evita que o objeto da persistência seja retornado diretamente por acidente.

## Mapeamento explícito

```csharp
static ClienteResponse ParaResposta(Cliente cliente) =>
    new(cliente.Id, cliente.Nome, cliente.Email);
```

Mapear manualmente deixa claro de onde vem cada valor e facilita revisar quais campos serão expostos. Para aplicações maiores, bibliotecas como AutoMapper ou Mapster podem reduzir código repetido, mas ainda é necessário conferir os mapeamentos, configurações e efeitos de manutenção.

## Projetar diretamente com EF Core

Quando a tela precisa de poucos campos, uma projeção pode buscar somente esses dados:

```csharp
var clientes = await db.Clientes
    .AsNoTracking()
    .Select(c => new ClienteResponse(c.Id, c.Nome, c.Email))
    .ToListAsync();
```

Assim o EF Core pode gerar SQL selecionando as colunas necessárias, em vez de carregar a entidade inteira. É importante inspecionar o SQL gerado e não presumir que toda expressão C# será traduzida da forma esperada.

## Entrada, validação e contrato

O DTO de entrada representa o formato que o cliente pode enviar. Validação de formato e regras de negócio continuam necessárias; declarar propriedades não torna o dado automaticamente confiável. Também é importante versionar contratos quando mudanças podem afetar clientes existentes.

**Apresentação usada em sala de aula:** Records, Imutabilidade Funcional e Mapeamentos DTO.
