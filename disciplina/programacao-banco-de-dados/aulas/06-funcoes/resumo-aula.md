# Resumo — Funções

O ponto principal que anotei é que uma stored function devolve um valor e pode aparecer numa expressão SQL. Na definição declaro o tipo com `RETURNS` e retorno o resultado com `RETURN`. Características como `DETERMINISTIC` e `NO SQL` precisam corresponder ao comportamento real da rotina.

Uma função chamada para cada linha pode pesar em uma consulta grande, então é importante pensar no custo. Procedure e function não são intercambiáveis: têm formas de chamada e finalidades diferentes. Veja o exemplo nas [anotações](./anotacoes.md) e no [script MySQL](./exemplos.sql).
