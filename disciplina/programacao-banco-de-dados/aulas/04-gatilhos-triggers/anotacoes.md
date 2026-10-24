# Minhas anotações: Gatilhos (Triggers)

O principal para mim foi entender que o trigger acontece automaticamente quando ocorre uma operação na tabela. Isso pode garantir uma regra mesmo quando a alteração vem de outro lugar, mas também deixa efeitos menos visíveis; por isso, preciso manter a lógica curta e documentada.

## Momento e evento

O MySQL oferece triggers `BEFORE` e `AFTER` para `INSERT`, `UPDATE` e `DELETE`. Cada linha afetada dispara a rotina; não há trigger por instrução que rode uma única vez para um lote inteiro.

## OLD e NEW

Em `INSERT`, use `NEW`; em `DELETE`, use `OLD`; em `UPDATE`, ambos representam os valores anterior e novo. Em trigger `BEFORE INSERT` ou `BEFORE UPDATE`, valores de `NEW` podem ser ajustados. Os campos de `OLD` são somente leitura.

## Exemplo de validação

```sql
DELIMITER $$
CREATE TRIGGER trg_pedidos_total_bi
BEFORE INSERT ON pedidos
FOR EACH ROW
BEGIN
  IF NEW.total < 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'O total do pedido não pode ser negativo';
  END IF;
END$$
DELIMITER ;
```

`DELIMITER` é um comando do cliente Workbench para que o ponto e vírgula interno não encerre a definição prematuramente; não faz parte da sintaxe enviada ao servidor como instrução SQL. `SIGNAL` interrompe a operação com erro.

## Cuidados

Use triggers para regras que precisam valer independentemente da aplicação, com lógica curta e documentada. Considere se `CHECK`, chave estrangeira ou transação resolve melhor. Evite efeitos ocultos, recursão indireta e dependência de ordem entre triggers; erros do trigger podem cancelar a instrução que o disparou.

## Exercícios

1. Crie um trigger `BEFORE UPDATE` que rejeite quantidade negativa.
2. Explique quais pseudorregistros ficam disponíveis em `DELETE`.
3. Proponha uma auditoria de alteração e descreva os dados que precisariam ser registrados.

