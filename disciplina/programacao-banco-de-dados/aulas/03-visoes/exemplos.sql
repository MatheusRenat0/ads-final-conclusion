-- Exemplo didático: adapte nomes e tipos ao seu esquema.
CREATE OR REPLACE VIEW vw_pedidos_resumo AS
SELECT p.id, p.criado_em, c.nome AS cliente, p.total
FROM pedidos AS p
JOIN clientes AS c ON c.id = p.cliente_id;

SELECT id, cliente, total
FROM vw_pedidos_resumo
WHERE total >= 100
ORDER BY criado_em DESC;

-- Metadados das views do schema atual
SELECT TABLE_NAME, DEFINER, SECURITY_TYPE, IS_UPDATABLE
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = DATABASE();

-- Remoção explícita quando necessário
-- DROP VIEW IF EXISTS vw_pedidos_resumo;
