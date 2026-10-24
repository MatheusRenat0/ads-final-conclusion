# Resumo: Transações e concorrência

Uma transação permite tratar várias instruções como uma unidade de trabalho. No exemplo de transferência, retiro o valor de uma conta e acrescento na outra; se uma das etapas falha, preciso desfazer para não deixar o banco num estado incompleto. No MySQL, essas garantias dependem de tabelas transacionais, como InnoDB.

ACID resume atomicidade, consistência, isolamento e durabilidade. Quando várias sessões trabalham ao mesmo tempo, o isolamento, os bloqueios e o MVCC controlam o que cada uma consegue ver ou alterar. Deadlocks podem acontecer; a aplicação deve lidar com o erro e só repetir operações que sejam seguras. Mais detalhes estão nas [anotações](./anotacoes.md) e no [script MySQL](./exemplos.sql).
