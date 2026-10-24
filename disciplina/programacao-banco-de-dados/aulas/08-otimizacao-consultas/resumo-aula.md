# Resumo — Otimização de consultas

Aprendi que não devo adicionar índices ou reescrever consultas sem antes entender o plano de execução. `EXPLAIN` mostra como o MySQL pretende executar a consulta; `EXPLAIN ANALYZE` também executa de fato, então preciso usá-lo com atenção.

Índices podem acelerar filtros e junções, mas ocupam espaço e tornam escritas mais custosas. Em índices compostos, a ordem das colunas faz diferença. O melhor é mudar uma coisa por vez e comparar com dados representativos. O exemplo está nas [anotações](./anotacoes.md) e no [script MySQL](./exemplos.sql).
