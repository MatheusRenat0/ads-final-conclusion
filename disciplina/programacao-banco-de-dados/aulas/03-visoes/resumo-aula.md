# Resumo: Visões (Views)

O que guardei desta aula é que uma view dá um nome a uma consulta que posso reutilizar. Com `CREATE VIEW`, posso deixar mais simples uma consulta recorrente ou expor apenas as colunas necessárias. Na maioria dos casos, a view guarda a definição da consulta, não uma cópia dos resultados.

Nem toda view pode ser atualizada diretamente, principalmente quando a consulta envolve agrupamentos ou outras operações mais complexas. Também preciso pensar em permissões e no efeito que mudanças nas tabelas de origem podem ter. As [anotações](./anotacoes.md) e o [script MySQL](./exemplos.sql) têm o exemplo completo.
