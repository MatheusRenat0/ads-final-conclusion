-- Inspecione primeiro o plano; adapte tabela e colunas ao schema.
EXPLAIN
SELECT id, criado_em, total
FROM pedidos
WHERE cliente_id = 10
ORDER BY criado_em DESC;

-- Índice de exemplo: avalie antes de manter em produção.
CREATE INDEX idx_pedidos_cliente_data
ON pedidos (cliente_id, criado_em);

-- Intervalo sargable para um dia, sem envolver a coluna em DATE():
SELECT id, criado_em, total
FROM pedidos
WHERE criado_em >= '2026-01-10 00:00:00'
  AND criado_em <  '2026-01-11 00:00:00';

-- EXPLAIN ANALYZE executa a consulta; disponível em versões MySQL recentes.
-- EXPLAIN ANALYZE SELECT ...;
