--CAPITULO 5
/*
1 - CREATE DATABASE					- Cria banco de dados
2 - ALTER DATABASE					- Altera banco de dados
3 - CREATE TABLE					- Cria tabela
4 - DROP TABLE/DATABASE IF EXISTS	- Exclusão condicional de tabela/banco de dados

*/
---------------------------Criar banco de dados simples
CREATE DATABASE dataone;
GO
---------------------------Renomear banco de dados
ALTER DATABASE dataone MODIFY NAME = data_one
GO
---------------------------Seta banco de dados
USE data_one;
GO

---------------------------Criar tabela
CREATE TABLE dados(
id_dado int NOT NULL IDENTITY PRIMARY KEY,
nome_dado VARCHAR(30) NOT NULL,
tipo_dado CHAR(2) NOT NULL
)
GO

---------------------------Exclusão condicional de tabela
DROP TABLE IF EXISTS dados;
GO

---------------------------Seta banco de dados
USE master;
GO

---------------------------Exclusão condicional de banco de dados
DROP DATABASE IF EXISTS data_one;
GO
