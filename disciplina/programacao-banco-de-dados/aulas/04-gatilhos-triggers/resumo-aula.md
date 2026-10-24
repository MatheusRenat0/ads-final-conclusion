# Resumo: Gatilhos (Triggers)

Nesta aula entendi que um trigger é executado automaticamente quando acontece um `INSERT`, `UPDATE` ou `DELETE`. No MySQL ele pode rodar antes ou depois da alteração, e é disparado para cada linha afetada. `NEW` e `OLD` dão acesso aos valores novos e anteriores, conforme o tipo de operação.

Um trigger pode validar uma regra ou registrar uma alteração, mas seus efeitos podem ficar escondidos para quem consulta a aplicação. Por isso, devo preferir restrições declarativas quando forem suficientes e deixar a lógica do trigger pequena. O exemplo com `SIGNAL` está nas [anotações](./anotacoes.md) e no [script MySQL](./exemplos.sql).
