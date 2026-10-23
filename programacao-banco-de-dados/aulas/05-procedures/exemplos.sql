-- Pré-requisito: tabela pedidos(cliente_id, total).
DROP PROCEDURE IF EXISTS p_contar_pedidos;
DELIMITER $$
CREATE PROCEDURE p_contar_pedidos(IN p_cliente_id INT, OUT p_total INT)
BEGIN
  SELECT COUNT(*) INTO p_total
  FROM pedidos
  WHERE cliente_id = p_cliente_id;
END$$
DELIMITER ;

CALL p_contar_pedidos(10, @quantidade);
SELECT @quantidade AS quantidade_pedidos;
-- Consulta de metadados: SHOW CREATE PROCEDURE p_contar_pedidos;
-- Limpeza opcional: DROP PROCEDURE IF EXISTS p_contar_pedidos;
