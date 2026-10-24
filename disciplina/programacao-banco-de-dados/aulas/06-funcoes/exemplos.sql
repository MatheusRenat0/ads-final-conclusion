DROP FUNCTION IF EXISTS fn_valor_com_desconto;
DELIMITER $$
CREATE FUNCTION fn_valor_com_desconto(
  p_valor DECIMAL(10,2),
  p_percentual DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
BEGIN
  RETURN p_valor * (1 - p_percentual / 100);
END$$
DELIMITER ;

SELECT fn_valor_com_desconto(200.00, 10.00) AS valor_final;
-- Metadados: SHOW CREATE FUNCTION fn_valor_com_desconto;
-- Limpeza opcional: DROP FUNCTION IF EXISTS fn_valor_com_desconto;
