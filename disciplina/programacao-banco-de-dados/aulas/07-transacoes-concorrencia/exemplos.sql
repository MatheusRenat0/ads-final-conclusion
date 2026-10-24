-- Demonstração ilustrativa; use somente em ambiente de estudo.
START TRANSACTION;
UPDATE contas SET saldo = saldo - 50.00 WHERE id = 1;
UPDATE contas SET saldo = saldo + 50.00 WHERE id = 2;
-- Inspecione os resultados antes de confirmar.
COMMIT;

-- Para desfazer uma nova operação ainda não confirmada:
-- ROLLBACK;

-- Leituras e configuração da sessão (execute separadamente):
SELECT @@transaction_isolation;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT saldo FROM contas WHERE id = 1 FOR UPDATE;
ROLLBACK;
