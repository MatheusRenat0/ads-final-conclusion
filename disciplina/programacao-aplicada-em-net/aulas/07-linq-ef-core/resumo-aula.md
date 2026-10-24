# Resumo: LINQ, EF Core e persistência

LINQ descreve filtros, ordenações e projeções; EF Core traduz operações compatíveis para SQL. A projeção busca somente os campos necessários, e `AsNoTracking()` reduz o trabalho de acompanhamento em consultas somente de leitura.

O SQL gerado, os índices e o plano de execução influenciam o desempenho. Consultas compiladas, tipos complexos e JSON dependem do contexto e do suporte do provedor. As [anotações](./anotacoes.md) reúnem exemplos e pontos para observar.
