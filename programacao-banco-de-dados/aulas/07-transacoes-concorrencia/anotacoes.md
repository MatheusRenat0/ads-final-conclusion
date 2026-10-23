# Anotações de estudo — Transações e Concorrência

> Material complementar alinhado ao plano de ensino. Não constitui registro de aula ministrada.

## ACID

- **Atomicidade:** operações da transação são aplicadas integralmente ou desfeitas.
- **Consistência:** restrições válidas continuam respeitadas.
- **Isolamento:** transações concorrentes têm interferência controlada.
- **Durabilidade:** após confirmação, alterações persistem conforme garantias do servidor.

No MySQL, use tabelas InnoDB para transações. `START TRANSACTION`, `COMMIT` e `ROLLBACK` controlam a unidade de trabalho.

## Exemplo

```sql
START TRANSACTION;
UPDATE contas SET saldo = saldo - 50 WHERE id = 1;
UPDATE contas SET saldo = saldo + 50 WHERE id = 2;
COMMIT;
```

Se ocorrer erro entre as atualizações, a aplicação deve executar `ROLLBACK` em vez de confirmar. O exemplo pressupõe validação de saldo e que ambas as linhas existam.

## Concorrência e isolamento

InnoDB implementa MVCC e bloqueios. Níveis como `READ COMMITTED` e `REPEATABLE READ` controlam visibilidade de leituras; `REPEATABLE READ` é o padrão comum do InnoDB, sujeito à versão e configuração. Leituras `SELECT ... FOR UPDATE` podem bloquear linhas para uma operação de leitura-modificação-gravação.

Deadlock pode ocorrer quando transações aguardam recursos umas das outras. O InnoDB detecta deadlocks e escolhe uma transação para desfazer; a aplicação deve estar preparada para repetir uma transação segura. Mantenha transações curtas e acesse recursos em ordem consistente.

## Exercícios

1. Envolva uma transferência entre contas em transação e indique onde validar saldo.
2. Compare `COMMIT` e `ROLLBACK`.
3. Explique como uma aplicação deve reagir a deadlock.

