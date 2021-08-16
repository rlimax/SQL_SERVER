--CAPITULO 7 CONSULTAS SIMPLES
/*
1 - SELECT
2 - FROM
3 - WHERE
4 - BETWEEN
5 - NOT
6 - IN
7 - LIKE
8 - NULL
9 - ORDER BY
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

--SELECT--FROM--------------------------------------------------------------------------
---------------------------Comando básico de retorno
SELECT * FROM tb_cliente;
SELECT nm_cliente FROM tb_cliente;

--WHERE---------------------------------------------------------------------------------
---------------------------Filtro ou condicional de retorno
SELECT * FROM tb_cliente WHERE sx_cliente = 'F';
SELECT * FROM tb_cliente WHERE sx_cliente <> 'F';

--BETWEEN-------------------------------------------------------------------------------
---------------------------Comando que define campo com intervalo de retorno
SELECT * FROM tb_cliente WHERE dt_nascimento BETWEEN '1970-12-01' AND '2000-12-01';

--NOT-----------------------------------------------------------------------------------
---------------------------Comando de negação de comando
SELECT * FROM tb_cliente WHERE dt_nascimento NOT BETWEEN '1970-12-01' AND '2000-12-01';

--IN------------------------------------------------------------------------------------
---------------------------Comando que define campo com lista base de retorno
SELECT * FROM tb_cliente WHERE naturalidadeUF IN ('RJ','SE','BA','MG');
SELECT * FROM tb_cliente WHERE naturalidadeUF NOT IN ('RJ','SE','BA','MG');

--LIKE----------------------------------------------------------------------------------
---------------------------Busca com base em trecho de valores
SELECT * FROM tb_cliente WHERE nm_cliente LIKE ('%iel');
SELECT * FROM tb_cliente WHERE nm_cliente NOT LIKE ('%iel');

--NULL----------------------------------------------------------------------------------
---------------------------Busca de campos com Nulos e negação de Nulos
SELECT * FROM tb_cliente WHERE estado_civil IS NULL;
SELECT * FROM tb_cliente WHERE estado_civil IS NOT NULL;

--ORDER BY------------------------------------------------------------------------------
---------------------------Ordena o retorno com base no campo definido
SELECT * FROM tb_cliente ORDER BY nm_cliente;
SELECT * FROM tb_cliente ORDER BY dt_nascimento DESC;


