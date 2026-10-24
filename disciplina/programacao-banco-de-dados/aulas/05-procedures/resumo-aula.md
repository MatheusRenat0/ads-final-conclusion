# Resumo: Procedures

Uma procedure agrupa instruções que posso chamar explicitamente com `CALL`. Os parâmetros podem trazer valores para a rotina (`IN`), devolver resultados (`OUT`) ou fazer as duas coisas (`INOUT`). Também posso guardar o resultado de uma consulta em uma variável com `SELECT ... INTO`.

Se uma operação tiver várias alterações relacionadas, a rotina pode usar transação, mas preciso decidir claramente se a aplicação ou a procedure é responsável por confirmar ou desfazer o trabalho. Handlers permitem definir como reagir a erros. As [anotações](./anotacoes.md) e o [script MySQL](./exemplos.sql) mostram um exemplo de chamada.
