-- Pré-requisito: tabela pedidos com coluna total DECIMAL.
-- No Workbench, DELIMITER é uma diretiva do cliente.
DROP TRIGGER IF EXISTS trg_pedidos_total_bi;
DELIMITER $$
CREATE TRIGGER trg_pedidos_total_bi
BEFORE INSERT ON pedidos
FOR EACH ROW
BEGIN
  IF NEW.total < 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'O total do pedido não pode ser negativo';
  END IF;
END$$
DELIMITER ;

-- Ver definição
SHOW CREATE TRIGGER trg_pedidos_total_bi;
-- Limpeza opcional: DROP TRIGGER IF EXISTS trg_pedidos_total_bi;
