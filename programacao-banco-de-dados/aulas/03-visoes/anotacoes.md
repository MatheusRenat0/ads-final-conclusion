# Anotações de estudo — Visões (Views)

> Material complementar alinhado ao plano de ensino. Não constitui registro de aula ministrada.

## Conceito e usos

Uma `VIEW` nomeia uma consulta para facilitar reutilização, reduzir repetição e limitar as colunas expostas a determinados usuários. A view não substitui modelagem, índices nem controle de acesso.

## Criar e consultar

```sql
CREATE OR REPLACE VIEW vw_pedidos_resumo AS
SELECT p.id, p.criado_em, c.nome AS cliente, p.total
FROM pedidos AS p
JOIN clientes AS c ON c.id = p.cliente_id;

SELECT id, cliente, total
FROM vw_pedidos_resumo
WHERE total >= 100
ORDER BY criado_em DESC;
```

A consulta consumidora pode filtrar e ordenar a view como uma tabela. Prefira listar colunas em vez de `SELECT *`, para deixar o contrato da view explícito.

## Atualização e limites

Algumas views simples permitem `INSERT`, `UPDATE` ou `DELETE`; views com agregações, `DISTINCT`, `GROUP BY`, `UNION` ou determinadas junções normalmente não são atualizáveis de forma direta. Mesmo quando aceita, uma alteração precisa corresponder sem ambiguidade às linhas da tabela base. Confira `INFORMATION_SCHEMA.VIEWS` e a documentação da versão do servidor.

## Segurança e manutenção

Conceda permissões sobre a view quando fizer sentido e avalie `SQL SECURITY DEFINER` versus `INVOKER`. O definidor e seus privilégios afetam a execução. Mudanças nas tabelas de origem podem quebrar a view; atualize-a junto com a evolução do esquema.

## Exercícios

1. Crie uma view que mostre pedidos e nomes de clientes.
2. Acrescente uma condição na consulta da view sem alterar sua definição.
3. Explique por que uma view com `GROUP BY` não equivale a uma tabela materializada.
4. Consulte os metadados da view no Workbench.

