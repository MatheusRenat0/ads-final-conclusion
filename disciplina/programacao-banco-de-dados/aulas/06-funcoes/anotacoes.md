# Minhas anotações: Funções

Nesta parte estou separando função de procedure: a função devolve um valor que posso usar numa expressão SQL. Também preciso declarar corretamente o tipo de retorno e as características da função, de acordo com o que ela realmente faz.

## Sintaxe e uso

```sql
DELIMITER $$
CREATE FUNCTION fn_valor_com_desconto(p_valor DECIMAL(10,2), p_percentual DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
BEGIN
  RETURN p_valor * (1 - p_percentual / 100);
END$$
DELIMITER ;

SELECT fn_valor_com_desconto(200.00, 10.00) AS valor_final;
```

A função declara tipo de retorno e usa `RETURN`. `DETERMINISTIC` declara que mesmas entradas produzem mesmo resultado; `NO SQL` declara que a função não lê nem grava tabelas. Essas características devem refletir o comportamento real, não ser escolhidas apenas para contornar configuração.

## Function e procedure

Uma function é adequada para produzir um valor em uma expressão. Procedure é chamada com `CALL` e pode expor parâmetros de saída e executar fluxos de trabalho com múltiplas instruções. A function não deve ser confundida com função agregada nem com trigger.

## Privilégios e limitações

Criação e execução dependem de privilégios e configuração de binlog do servidor. Funções chamadas em consultas podem rodar muitas vezes, uma por linha, então evite lógica custosa. Não prometa que a função sempre será executada uma única vez.

## Exercícios

1. Escreva uma função que calcule o preço com imposto.
2. Explique por que uma função que consulta tabela não deve ser declarada `NO SQL`.
3. Compare a chamada de função em `SELECT` com procedure via `CALL`.

