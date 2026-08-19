-- =====================================================
-- AULA 02 - RESTRIÇÕES E JUNÇÕES
-- Programação de Banco de Dados
-- =====================================================


-- =====================================================
-- 1. CRIAÇÃO DA TABELA FUNCIONARIOS
-- =====================================================

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


-- =====================================================
-- 2. JUNÇÃO (JOIN)
-- =====================================================

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