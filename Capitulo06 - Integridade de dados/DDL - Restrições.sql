--CAPITULO 6 RESTRIÇÕES
/*
1 - DEFAULT			- Preenchimento com valores padrão;
2 - CHECK			- Limita os valores que o usuário pode inserir;
4 - UNIQUE			- Também especifica valores exclusivos sem funcionar como identificador de registro;
3 - PRIMARY KEY		- Especifica que a coluna só pode conter valores exclusivos e identificador de registro;
5 - FOREIGN KEY		- Campo de vinculo entre duas tabelas;

PODEM SER NOMEADAS E INLINE
*/

CREATE DATABASE cap6
GO
USE cap6;
GO



--DEFAULT--------------------------------------------------------------------------------

CREATE TABLE CLIENTE(
id_cliente INT NOT NULL PRIMARY KEY IDENTITY(1,1),
nm_cliente VARCHAR(100) NOT NULL,
sx_cliente CHAR(3) NOT NULL DEFAULT 'I' -- I => INDEFINIDO
)

INSERT INTO CLIENTE(nm_cliente,sx_cliente) VALUES('Luiz','M') -- Valor Informado
INSERT INTO CLIENTE(nm_cliente,sx_cliente) VALUES('Marilia','F') -- Valor Informado
INSERT INTO CLIENTE(nm_cliente) VALUES('Amaury')   -- Valor não informado -> Default
INSERT INTO CLIENTE(nm_cliente,sx_cliente) VALUES('Ana','F') -- Valor Informado

SELECT * FROM CLIENTE


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--CHECK
--[0-9] Qualquer dígito
--[a-z] Qualquer letra
--[aeiou] Qualquer vogal
--[^0-9] Negação de dígito
--[^a-z] Negação de letra
--[^aeiou] Negação de vogal

CREATE TABLE FUNCIONARIO(
	id_funcionario int NOT NULL IDENTITY(1,1),
	nm_funcionario varchar(100) NOT NULL,
	desc_area varchar(100) NOT NULL,
	nivel varchar(2) NOT NULL CHECK ((nivel like '[0-9]%')),
	CONSTRAINT [CK_FUNCIONARIO_AREA] CHECK ((desc_area like '[a-z]%')), --Aceita somente iniciado com texto
	--CONSTRAINT [CK_FUNCIONARIO_NIVEL] CHECK ((nivel like '[0-9]%')) --Aceita somente iniciado com número
)

INSERT INTO FUNCIONARIO VALUES 
	('Goku Kakaroto','Analista de negócio','1a'),
	('Naruto Uzumaki','Técnico de teste','2b')

select * FROM FUNCIONARIO

INSERT INTO FUNCIONARIO VALUES ('Goku Kakaroto','0Analista de negócio','1a') --Erro ao Iniciar desc_area com número
INSERT INTO FUNCIONARIO VALUES ('Naruto Uzumaki','Técnico de teste','b2') --Erro ao Iniciar nível com letra


------------------------------------------------------------------------------------------

--UNIQUE
CREATE TABLE FORNECEDOR(
	id_fornecedor int NOT NULL PRIMARY KEY IDENTITY(1,1),
	nm_fornecedor varchar(100) NOT NULL,
	cnpj_fornecedor varchar(13) NOT NULL UNIQUE,
	cpf_responsavel varchar(11) NOT NULL UNIQUE,
	rg_responsavel varchar(10) NOT NULL UNIQUE
)

INSERT 
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------