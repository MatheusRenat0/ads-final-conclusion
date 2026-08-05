# Aula 01 — Introdução e Revisão SQL

> **Data:** 04/08/2026

---

# Objetivo da Aula

Nesta primeira aula foi realizada uma revisão dos conceitos fundamentais de Banco de Dados Relacional e da linguagem SQL. O objetivo foi relembrar a estrutura de um banco de dados, compreender o processo de modelagem, revisar os principais grupos de comandos SQL e reforçar a construção de consultas, preparando a base para os conteúdos mais avançados da disciplina.

---

# 1. Fundamentos de Banco de Dados

Antes de criar tabelas ou escrever consultas SQL, é necessário entender como um banco de dados é organizado.

Um **Banco de Dados Relacional** é um modelo que armazena informações em tabelas. Essas tabelas podem se relacionar entre si por meio de **chaves**, permitindo que diferentes informações sejam conectadas de forma organizada.

Esse modelo tem como principais características:

- Organização dos dados em tabelas;
- Relacionamento entre tabelas;
- Integridade das informações através de restrições;
- Manipulação dos dados utilizando SQL.

---

## Estrutura de uma Tabela

Toda tabela é formada por linhas e colunas.

### Atributo

São as colunas da tabela.

Exemplo:

| Código | Nome | Idade |
|---------|------|-------|

Nesse caso:

- Código
- Nome
- Idade

são atributos da tabela.

---

### Domínio

O domínio define quais valores um atributo pode receber.

Exemplos:

- Idade → Apenas números inteiros.
- Nome → Texto com até 100 caracteres.
- DataNascimento → Tipo DATE.

Isso garante que apenas valores válidos sejam armazenados.

---

### Restrições (Constraints)

As restrições servem para manter a integridade dos dados.

As principais são:

- **NOT NULL** → O campo não pode ficar vazio.
- **UNIQUE** → Não permite valores repetidos.
- **PRIMARY KEY** → Identifica unicamente cada registro.
- **FOREIGN KEY** → Cria relacionamento entre tabelas.

Essas regras evitam inconsistências no banco de dados.

---

# 2. Modelagem de Banco de Dados

Antes da implementação, o banco de dados passa por três etapas de modelagem.

## Modelo Conceitual

É a primeira etapa do projeto.

Seu objetivo é representar as entidades e seus relacionamentos, sem considerar qual banco de dados será utilizado.

Normalmente é representado através do **DER (Diagrama Entidade-Relacionamento)**.

---

## Modelo Lógico

Transforma o modelo conceitual em tabelas relacionais.

Nesta etapa são definidos:

- Tabelas;
- Colunas;
- Chaves Primárias;
- Chaves Estrangeiras;
- Relacionamentos.

Ainda não existe código SQL.

---

## Modelo Físico

É a implementação do banco.

Nesta etapa são criados os scripts SQL utilizando um SGBD específico, como:

- SQL Server
- MySQL
- PostgreSQL

Aqui começam a ser utilizados comandos como:

```sql
CREATE TABLE
ALTER TABLE
DROP TABLE
```

---

# 3. Linguagem SQL

A SQL é dividida em grupos de comandos conforme sua finalidade.

## DDL (Data Definition Language)

Responsável pela definição da estrutura do banco.

### CREATE

Cria objetos.

Exemplo:

```sql
CREATE TABLE Cliente(
    Id INT,
    Nome VARCHAR(100)
);
```

### ALTER

Modifica uma estrutura existente.

Exemplo:

```sql
ALTER TABLE Cliente
ADD Email VARCHAR(100);
```

### DROP

Remove um objeto do banco.

```sql
DROP TABLE Cliente;
```

---

## DML (Data Manipulation Language)

Manipula os registros existentes.

### INSERT

Insere novos registros.

```sql
INSERT INTO Cliente
VALUES (1,'Matheus');
```

### UPDATE

Atualiza informações.

```sql
UPDATE Cliente
SET Nome='João'
WHERE Id=1;
```

> Nunca utilize UPDATE sem WHERE, pois todos os registros serão alterados.

### DELETE

Remove registros.

```sql
DELETE FROM Cliente
WHERE Id=1;
```

> Assim como UPDATE, utilizar DELETE sem WHERE removerá todos os registros da tabela.

---

## DCL (Data Control Language)

Responsável pelo controle de permissões.

Principais comandos:

- GRANT
- REVOKE

---

## DTL (Data Transaction Language)

Controla transações no banco de dados.

### BEGIN

Inicia uma transação.

### COMMIT

Confirma definitivamente as alterações.

### ROLLBACK

Desfaz todas as alterações caso ocorra algum erro.

Esses comandos garantem a consistência dos dados.

---

# 4. CRUD

CRUD representa as quatro operações básicas realizadas em qualquer sistema.

| Operação | Comando SQL |
|----------|-------------|
| Create | INSERT |
| Read | SELECT |
| Update | UPDATE |
| Delete | DELETE |

Praticamente qualquer aplicação utiliza essas quatro operações para interagir com o banco de dados.

---

# 5. Consultas SQL

O comando **SELECT** é utilizado para consultar informações armazenadas no banco.

Estrutura:

```sql
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
```

## SELECT

Define quais colunas serão exibidas.

## FROM

Informa de qual tabela os dados serão obtidos.

## WHERE

Filtra os registros.

Exemplo:

```sql
WHERE Idade >= 18
```

## GROUP BY

Agrupa registros com valores iguais.

É utilizado juntamente com funções de agregação.

## HAVING

Filtra os grupos criados pelo GROUP BY.

## ORDER BY

Ordena os resultados.

Pode ser crescente (ASC) ou decrescente (DESC).

---

# 6. Operadores

## Comparação

- =
- <>
- >
- <
- >=
- <=

## Lógicos

- AND
- OR
- NOT

## Operadores Especiais

### IN

Verifica se um valor pertence a uma lista.

### LIKE

Realiza buscas por padrões de texto.

### BETWEEN

Filtra valores dentro de um intervalo.

---

# 7. Funções

As funções facilitam cálculos e manipulação dos dados.

## Funções de Agregação

- COUNT() → Conta registros.
- SUM() → Soma valores.
- AVG() → Calcula média.
- MAX() → Maior valor.
- MIN() → Menor valor.

São frequentemente utilizadas juntamente com o GROUP BY.

---

## Funções de Data

### CURDATE()

Retorna apenas a data atual.

### NOW()

Retorna a data e hora atuais.

---

# 8. Ambientes de Desenvolvimento

Durante o desenvolvimento de um sistema, normalmente existem diferentes ambientes.

### Desenvolvimento

Local onde o banco de dados é criado, testado e modificado.

### Integração

Ambiente utilizado para conectar o banco à aplicação e validar seu funcionamento.

Ferramentas comuns:

- MySQL
- SQL Server
- PostgreSQL
- DBeaver
- HeidiSQL

---

# Resumo da Aula

A primeira aula teve como objetivo revisar os principais conceitos necessários para acompanhar a disciplina. Foram relembrados os fundamentos dos bancos de dados relacionais, o processo de modelagem, os grupos de comandos SQL (DDL, DML, DCL e DTL), as operações CRUD, a construção de consultas com SELECT, operadores, funções de agregação e os ambientes utilizados no desenvolvimento de aplicações.

Essa revisão servirá como base para os próximos conteúdos, que abordarão recursos mais avançados da programação de banco de dados, como **Views, Joins, Triggers, Procedures, Functions, Transações e Otimização de Consultas**.

---

# O que revisar antes da próxima aula

- Estrutura do comando `SELECT`;
- Comandos DDL e DML;
- Operações CRUD;
- Restrições de Integridade;
- Conceitos de modelagem de banco de dados.