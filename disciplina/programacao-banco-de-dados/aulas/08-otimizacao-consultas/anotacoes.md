# Anotações de estudo — Otimização de Consultas

## Plano de execução

`EXPLAIN` mostra como o otimizador pretende executar uma consulta: tabelas acessadas, índices considerados, estimativas de linhas e tipo de acesso. Em versões recentes do MySQL, `EXPLAIN ANALYZE` executa a consulta e informa tempos e linhas observadas; use cautela, pois há execução real.

```sql
EXPLAIN
SELECT id, criado_em, total
FROM pedidos
WHERE cliente_id = 10
ORDER BY criado_em DESC;
```

Analise estimativas e acesso, sem interpretar uma coluna isoladamente. Compare com dados e distribuição reais.

## Índices

Índices podem acelerar buscas, junções e ordenações, mas ocupam espaço e aumentam custo de escrita. Um índice composto `(cliente_id, criado_em)` pode servir para consultas que filtram pelo prefixo `cliente_id`; ordem das colunas importa. Índice não garante que será escolhido pelo otimizador.

```sql
CREATE INDEX idx_pedidos_cliente_data
ON pedidos (cliente_id, criado_em);
```

Evite envolver coluna indexada em função quando isso impedir busca eficiente, por exemplo `DATE(criado_em) = ...`; prefira intervalo de datas. Não crie índices indiscriminadamente.

## Processo de otimização

1. Registre consulta e objetivo.
2. Use `EXPLAIN` e observe plano/estimativas.
3. Verifique filtros, junções, cardinalidade e índices.
4. Altere uma coisa por vez.
5. Compare tempo e resultado com volume representativo.

## Exercícios

1. Analise `EXPLAIN` de uma consulta com filtro e ordenação.
2. Proponha índice composto e explique sua ordem.
3. Reescreva filtro por data como intervalo inclusivo no início e exclusivo no fim.

