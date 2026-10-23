# Anotações de estudo — Procedures

## Parâmetros e chamada

- `IN`: entrada; padrão quando o modo é omitido.
- `OUT`: devolve um valor ao chamador.
- `INOUT`: recebe e devolve um valor.

No MySQL Workbench, use uma diretiva `DELIMITER` diferente durante a criação para preservar os `;` internos.

```sql
DELIMITER $$
CREATE PROCEDURE p_contar_pedidos(IN p_cliente_id INT, OUT p_total INT)
BEGIN
  SELECT COUNT(*) INTO p_total
  FROM pedidos WHERE cliente_id = p_cliente_id;
END$$
DELIMITER ;

CALL p_contar_pedidos(10, @quantidade);
SELECT @quantidade;
```

## Tratamento de erros e transações

`DECLARE ... HANDLER` pode tratar condições. Em operações com várias escritas, uma procedure pode iniciar uma transação, confirmar com `COMMIT` e desfazer com `ROLLBACK`; defina claramente quem é responsável pela transação para evitar conflitos com a aplicação. Tabelas precisam usar mecanismo transacional, como InnoDB, para rollback efetivo.

## Cuidados

Use nomes e parâmetros claros, valide entradas e limite privilégios. Procedure não é automaticamente mais rápida nem mais segura: o benefício depende do caso e do modelo de permissões.

## Exercícios

1. Adapte a rotina para contar pedidos de um período.
2. Crie um parâmetro `OUT` para devolver soma de valores.
3. Descreva o que deve ocorrer quando uma instrução interna falhar.

