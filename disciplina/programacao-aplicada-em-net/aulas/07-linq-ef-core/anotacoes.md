# Minhas anotações: LINQ e EF Core

LINQ permite expressar consultas sobre coleções e fontes de dados usando operadores conhecidos. Com EF Core, parte dessas expressões é traduzida para SQL. Por isso, uma consulta em C# precisa ser pensada também pelo que vai acontecer no banco.

## Filtrar, ordenar e projetar

```csharp
var recentes = await db.Pedidos
    .Where(p => p.CriadoEm >= inicio)
    .OrderByDescending(p => p.CriadoEm)
    .Select(p => new PedidoResumo(p.Id, p.Status, p.Total))
    .ToListAsync();
```

`Where` filtra, `OrderByDescending` ordena e `Select` escolhe os campos. Projetar o formato necessário reduz dados trafegados e evita carregar propriedades que a consulta não utiliza.

## Rastreamento

O EF Core acompanha entidades carregadas para detectar alterações que serão persistidas. Para leitura sem atualização, `AsNoTracking()` reduz esse trabalho e deixa explícita a intenção. Se for necessário modificar e salvar a entidade, o rastreamento pode ser útil.

## Consultas compostas

Joins, agrupamentos e subconsultas devem refletir a pergunta feita à base. Consultas complexas podem gerar SQL caro ou difícil de manter. Verifico a quantidade de dados, índices envolvidos, plano de execução e SQL produzido, especialmente quando a consulta roda em listas grandes.

## Consultas compiladas e JSON

EF Core oferece consultas compiladas para cenários em que a mesma forma de consulta é executada repetidamente e a medição justifica esse recurso. Tipos complexos e mapeamentos JSON dependem da versão do EF Core, do provedor e do banco. Não assumo suporte igual para todos os ambientes.

## Cuidados comuns

- Evitar carregar entidades completas quando a resposta precisa de poucos campos.
- Observar o problema de consultas N+1, em que uma consulta inicial dispara muitas outras.
- Paginar resultados extensos e definir limites para entradas externas.
- Conferir SQL e plano de execução em vez de estimar desempenho só pela aparência do LINQ.
- Usar transações quando várias operações precisam manter uma unidade consistente.

**Apresentação usada em sala de aula:** conteúdo programático da disciplina.
