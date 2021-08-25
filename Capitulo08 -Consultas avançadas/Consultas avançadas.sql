-- CAPITULO 8 CONSULTAS AVANÇADAS
/*
1 - INNER JOIN
2 - LEFT OUTER JOIN
3 - RIGHT OUTER JOIN
4 - FULL OUTER JOIN
5 - ABS
6 - DATEADD
7 - DATEDIFF
8 - DATEPART
9 - LEFT
10 - LEN
11 - LOWER
12 - PI
13 - RAND
14 - RIGHT
15 - ROUND
16 - SQRT
17 - SQUARE
18 - UPPER

*/

-- Criação de base e tabela para exercício-----------------------------------------------
-- --------------------------------------------------------------------------------------
CREATE DATABASE one;
GO
USE one;
GO
CREATE TABLE agente(
cod_agente INT PRIMARY KEY NOT NULL IDENTITY(1,1),
nm_agente VARCHAR(100) NOT NULL,
nm_sobrenome VARCHAR(100) NOT NULL,
dt_cadastro DATE
);
GO
CREATE TABLE parceiro(
cod_parceiro INT PRIMARY KEY NOT NULL IDENTITY(1,1),
nm_parceiro VARCHAR(100) NOT NULL,
nm_sobrenome VARCHAR(100) NOT NULL,
dt_cadastro DATE
);
GO
 ALTER TABLE agente
	ADD cod_parceiro INT;
 ALTER TABLE parceiro
	ADD cod_agente INT;
GO
-- add constraint fk_parceiro_agente foreign key(cod_agente) references agente(cod_agente);

-- Inserção de dados para exercício------------------------------------------------------
-- --------------------------------------------------------------------------------------
INSERT INTO agente VALUES
	('Agente1', 'Sobrenome1_Agente','2020-01-01',NULL),
	('Agente2', 'Sobrenome2_Agente','2020-02-01',NULL),
	('Agente3', 'Sobrenome3_Agente','2020-03-01',NULL),
	('Agente4', 'Sobrenome4_Agente','2020-04-01',NULL),
	('Agente5', 'Sobrenome5_Agente','2020-05-01',NULL),
	('Agente6', 'Sobrenome6_Agente','2020-06-01',6),
	('Agente7', 'Sobrenome7_Agente','2020-07-01',NULL);
	
INSERT INTO parceiro VALUES
	('Parceiro1', 'Sobrenome1Parceiro','2021-06-01',1),
	('Parceiro2', 'Sobrenome2Parceiro','2021-06-01',2),
	('Parceiro3', 'Sobrenome3Parceiro','2021-05-01',3),
	('Parceiro4', 'Sobrenome4Parceiro','2021-05-01',4),
	('Parceiro5', 'Sobrenome5Parceiro','2021-04-01',NULL),
	('Parceiro6', 'Sobrenome6Parceiro','2021-04-01',6);
    
-- INNER JOIN ---------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------
SELECT * FROM agente
INNER JOIN parceiro ON agente.cod_parceiro = parceiro.cod_parceiro;
    
-- LEFT OUTER JOIN ----------------------------------------------------------------------
-- --------------------------------------------------------------------------------------
SELECT * FROM agente
LEFT OUTER JOIN parceiro ON agente.cod_parceiro = parceiro.cod_parceiro;

-- RIGHT OUTER JOIN ---------------------------------------------------------------------
-- --------------------------------------------------------------------------------------
SELECT * FROM agente
RIGHT OUTER JOIN parceiro ON agente.cod_parceiro = parceiro.cod_parceiro;

-- FULL OUTER JOIN ----------------------------------------------------------------------
-- --------------------------------------------------------------------------------------
SELECT * FROM agente
FULL OUTER JOIN parceiro ON agente.cod_parceiro = parceiro.cod_parceiro;

-- ABS ----------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------
SELECT ABS(10);
SELECT ABS(-9);

-- DATEADD ------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------
SELECT dt_cadastro, DATEADD(DAY,1,dt_cadastro) FROM agente;
SELECT dt_cadastro, DATEADD(MONTH,1,dt_cadastro) FROM agente;
SELECT dt_cadastro, DATEADD(YEAR,1,dt_cadastro) FROM agente;

-- DATEDIFF ------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------
SELECT dt_cadastro, DATEDIFF(DAY,dt_cadastro,GETDATE()) FROM agente;
SELECT dt_cadastro, DATEDIFF(MONTH,dt_cadastro,GETDATE()) FROM agente;
SELECT dt_cadastro, DATEDIFF(YEAR,dt_cadastro,GETDATE()) FROM agente;
