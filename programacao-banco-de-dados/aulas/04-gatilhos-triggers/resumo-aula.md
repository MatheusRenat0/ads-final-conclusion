# Resumo — Gatilhos (Triggers)

> Síntese de estudo complementar; sem registro de que o conteúdo tenha sido ministrado.

- Triggers são executados automaticamente por linha em INSERT, UPDATE ou DELETE.
- MySQL oferece BEFORE e AFTER.
- `NEW` e `OLD` representam valores novos e antigos conforme o evento.
- `SIGNAL SQLSTATE 45000` permite sinalizar erro de negócio.
- Prefira regras declarativas quando bastarem e mantenha triggers simples.

Consulte [anotações](./anotacoes.md) para explicações, exemplos e exercícios, e [script SQL](./exemplos.sql) para os exemplos MySQL.
