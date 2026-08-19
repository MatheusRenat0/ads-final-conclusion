# Resumo da Aula 02 — Restrições e Junções

## 1. Restrições

As restrições são regras aplicadas às estruturas e aos dados de um banco de dados. Seu objetivo é garantir a precisão, consistência e confiabilidade das informações armazenadas.

Durante a aula foram apresentados os seguintes conceitos:

* **Tabela (chaves)**
* **Domínio (valores)**
* **Referencial (FK)**
* **Constraints**
* **Visões**
* **Gatilhos**
* **Procedures**
* **Functions**

Os últimos itens foram apresentados como conceitos avançados relacionados ao banco de dados.

---

# 2. Constraints

As `CONSTRAINTS` permitem estabelecer regras para os valores que podem ser armazenados em uma tabela.

Na aula foi utilizado como exemplo o cadastro de funcionários:

```sql
CREATE TABLE FUNCIONARIOS (
    codFUNC INT PRIMARY KEY,
    NOMEFUNC VARCHAR(30) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    RG CHAR(10) NOT NULL UNIQUE,
    SALARIO DECIMAL(10,2)
        CHECK (SALARIO > 0),
    DATA_CADASTRO DATE DEFAULT CURRENT_DATE,
    STATUS VARCHAR(10) DEFAULT 'Ativo'
        CHECK (STATUS IN ('Ativo', 'Inativo'))
);
```

Esse exemplo reúne diferentes restrições em uma única tabela.

---

## PRIMARY KEY

```sql
codFUNC INT PRIMARY KEY
```

A coluna `codFUNC` foi definida como chave primária da tabela.

---

## NOT NULL

```sql
NOMEFUNC VARCHAR(30) NOT NULL
```

Indica que o campo deve possuir um valor.

No exemplo, `NOMEFUNC`, `CPF` e `RG` não podem ficar vazios.

---

## UNIQUE

```sql
CPF CHAR(11) NOT NULL UNIQUE
```

Define que o valor não pode se repetir entre os registros.

No exemplo, tanto `CPF` quanto `RG` possuem essa restrição.

---

## CHECK

A restrição `CHECK` estabelece uma condição que precisa ser respeitada.

No salário:

```sql
CHECK (SALARIO > 0)
```

O valor do salário precisa ser maior que zero.

No status:

```sql
CHECK (STATUS IN ('Ativo', 'Inativo'))
```

O status deve estar entre os valores definidos.

---

## DEFAULT

```sql
DATA_CADASTRO DATE DEFAULT CURRENT_DATE
```

Define um valor padrão para o campo quando nenhum valor é informado.

No exemplo, a data de cadastro recebe a data atual.

Também foi definido:

```sql
STATUS VARCHAR(10) DEFAULT 'Ativo'
```

Nesse caso, o status padrão será `Ativo`.

---

# 3. Junções — JOIN

Uma junção (`JOIN`) é utilizada para combinar dados provenientes de diferentes tabelas.

Para realizar essa combinação, são utilizadas colunas relacionadas entre as tabelas, normalmente por meio de chaves.

Durante a aula foram apresentados:

* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`

O conceito foi relacionado ao uso de:

* **PK — Primary Key**
* **FK — Foreign Key**

---

# 4. Exemplo de JOIN

Foi apresentado um exemplo relacionando quatro tabelas:

* `ALUNOS`
* `CAMPUS`
* `UF`
* `DISCIPLINAS`

A consulta foi:

```sql
SELECT 
    a.NOMEALUNO AS 'Nome do Aluno',
    c.campus AS 'Nome do Campus',
    d.disciplina AS 'Disciplina',
    u.UF AS 'ESTADO'
FROM ALUNOS a
JOIN campus c
    ON a.codcampus = c.codcampus
JOIN UF u
    ON a.codUF = u.codUF
JOIN disciplinas d
    ON a.coddisciplina = d.coddisciplina
WHERE a.codcampus = '15'
  AND a.codcurso = '1721'
  AND a.codperiodo = '3'
ORDER BY 2, 1;
```

---

## Entendendo a consulta

### SELECT

Define as informações que serão exibidas:

```sql
a.NOMEALUNO
c.campus
d.disciplina
u.UF
```

Também foram utilizados `AS` para definir nomes mais amigáveis para as colunas retornadas.

---

### FROM

```sql
FROM ALUNOS a
```

Define a tabela principal da consulta e cria o apelido `a` para ela.

---

### JOIN

A consulta relaciona as tabelas utilizando suas colunas correspondentes.

Exemplo:

```sql
JOIN campus c
    ON a.codcampus = c.codcampus
```

O relacionamento acontece entre `a.codcampus` e `c.codcampus`.

O mesmo princípio é aplicado às demais tabelas:

```sql
JOIN UF u
    ON a.codUF = u.codUF
```

e:

```sql
JOIN disciplinas d
    ON a.coddisciplina = d.coddisciplina
```

---

### WHERE

O `WHERE` restringe os registros retornados pela consulta.

Neste exemplo:

```sql
WHERE a.codcampus = '15'
  AND a.codcurso = '1721'
  AND a.codperiodo = '3'
```

A consulta considera os registros que atendem às três condições.

---

### ORDER BY

```sql
ORDER BY 2, 1;
```

Define a ordenação do resultado utilizando a posição das colunas retornadas pelo `SELECT`.

---

# Resumo dos Conceitos

| Conceito      | Finalidade                 |
| ------------- | -------------------------- |
| `PRIMARY KEY` | Identificar registros      |
| `FOREIGN KEY` | Relacionar tabelas         |
| `NOT NULL`    | Impedir valores vazios     |
| `UNIQUE`      | Impedir valores duplicados |
| `CHECK`       | Estabelecer condições      |
| `DEFAULT`     | Definir valores padrão     |
| `JOIN`        | Combinar dados de tabelas  |
| `WHERE`       | Filtrar registros          |
| `ORDER BY`    | Ordenar resultados         |

---

# Resumo da Aula

A segunda aula aprofundou os conceitos de integridade dos dados e relacionamento entre tabelas. Foram apresentadas diferentes restrições utilizadas na criação de tabelas, incluindo `PRIMARY KEY`, `NOT NULL`, `UNIQUE`, `CHECK` e `DEFAULT`.

Também foi introduzido o conceito de `JOIN`, mostrando como combinar informações de várias tabelas através de colunas relacionadas e chaves. O exemplo prático utilizou as tabelas `ALUNOS`, `CAMPUS`, `UF` e `DISCIPLINAS`.

Esses conceitos são fundamentais para trabalhar com bancos de dados relacionais e serão utilizados nos próximos conteúdos da disciplina.
