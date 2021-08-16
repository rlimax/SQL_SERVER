--CAPITULO 7 FUNÇÕES INTEGRADAS
/*
1 - AVG
2 - COUNT
3 - MAX
4 - MIN
5 - SUM
6 - STDEV
7 - VAR
*/

--Criação de base e tabela para exercício-----------------------------------------------
----------------------------------------------------------------------------------------
CREATE DATABASE cliente;
GO
USE cliente;
GO
CREATE TABLE tb_cliente(
 id_cliente INT not null PRIMARY KEY IDENTITY(1,1),
 nm_cliente VARCHAR(100) not null,
 sobrenome_cliente VARCHAR(100) not null,
 dt_nascimento DATE not null,
 naturalidadeUF CHAR(2) not null,
 sx_cliente CHAR(1) DEFAULT 'I',
 estado_civil CHAR(1),
 idade tinyint,
 saldo decimal(8,2)
);
GO

INSERT INTO tb_cliente	VALUES
	('Maria','Martins','1982-12-21','CE','F','S',38,100.00),
	('Joaquim','Moraes','2008-12-01','CE','M','C',12,110.00),
	('Lucia','Moraes','2000-12-01','MG','F','S',20,202.00),
	('Ezequiel','Nobrega','1998-12-01','RJ','M','S',22,310.00),
	('Daniel','Silva','2001-12-01','SE','M',NULL,19,90.00),
	('Marcia','Coelho','2011-12-01','BA','F','C',9,40.50),
	('Elizabete','Veloso','1975-12-01','SP','F','S',45,88.10),
	('Angelica','Hulk','1970-12-01','SP','F',NULL,50,1100.00)
GO

--AVG-----------------------------------------------------------------------------------
---------------------------Função que retorna a média no campo com os valores retornados
SELECT sx_cliente, AVG(idade) FROM tb_cliente group by sx_cliente;

--COUNT---------------------------------------------------------------------------------
---------------------------Retorna a contagem no campo com os valores retornados
SELECT sx_cliente, COUNT(*) FROM tb_cliente group by sx_cliente;

--MAX-----------------------------------------------------------------------------------
---------------------------Retorna o registro de maior valor do campo selecionado
SELECT MAX(idade) FROM tb_cliente;
SELECT MAX(dt_nascimento) FROM tb_cliente;

--MIN-----------------------------------------------------------------------------------
---------------------------Retorna o registro de menor valor do campo selecionado
SELECT MIN(idade) FROM tb_cliente;
SELECT MIN(dt_nascimento) FROM tb_cliente;

--SUM-----------------------------------------------------------------------------------
---------------------------Função que retorna a soma no campo com os valores retornados
SELECT SUM(saldo) FROM tb_cliente
SELECT SUM(saldo) FROM tb_cliente where sx_cliente = 'F'

--STDEV (simples)-----------------------------------------------------------------------
---------------------------Função que retorna o desvio padrão no campo
SELECT STDEV(saldo) FROM tb_cliente

--VAR (simples)-------------------------------------------------------------------------
---------------------------Função que retorna a variação estatística no campo
SELECT VAR(saldo) FROM tb_cliente
