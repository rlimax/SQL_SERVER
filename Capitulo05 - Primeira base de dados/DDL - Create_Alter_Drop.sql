--CAPITULO 5
/*
1 - CREATE DATABASE					- Cria banco de dados
2 - ALTER DATABASE					- Altera banco de dados
3 - CREATE TABLE					- Cria tabela
4 - DROP TABLE/DATABASE IF EXISTS	- Exclusão condicional de tabela/banco de dados

*/
--CREATE DATABASE-----------------------------------------------------------------------
---------------------------Criar banco de dados simples
CREATE DATABASE dataone;
GO

--ALTER DATABASE------------------------------------------------------------------------
---------------------------Criar novo arquivo de dados para o banco de dados
ALTER DATABASE dataone ADD FILE ( NAME = 'dataone_n', 
								  FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\dataone_n.ndf' , 
								  SIZE = 8192KB , 
								  MAXSIZE = 102400KB , 
								  FILEGROWTH = 10240KB ) TO FILEGROUP [PRIMARY]
GO

---------------------------Lista arquivos referente ao banco de dados
USE dataone;
SELECT df.file_id, df.name  from sys.database_files df
GO

---------------------------Esvaziar arquivo de dados
DBCC SHRINKFILE ('dataone_n' , EMPTYFILE)
GO

---------------------------Remove arquivo de dados
ALTER DATABASE dataone  REMOVE FILE dataone_n
GO

---------------------------Adicionar novo grupo de arquivos
ALTER DATABASE dataone ADD FILEGROUP EXTRA
GO

---------------------------Criar novo arquivo de dados para o banco de dados
ALTER DATABASE dataone ADD FILE ( NAME = 'dataone_n', 
								  FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\dataone_n.ndf' , 
								  SIZE = 8192KB , 
								  MAXSIZE = 102400KB , 
								  FILEGROWTH = 10240KB ) TO FILEGROUP EXTRA
GO

---------------------------Renomear banco de dados
ALTER DATABASE dataone MODIFY NAME = data_one
--EXEC sp_rename 'dataone', 'data_one';
GO

---------------------------Seta banco de dados
USE data_one;
GO

--CREATE TABLE--------------------------------------------------------------------------
---------------------------Criar tabela
CREATE TABLE dados_one(
id_dado int NOT NULL IDENTITY PRIMARY KEY,
nome_dado VARCHAR(30) NOT NULL,
tipo_dado CHAR(2) NOT NULL
)
GO

--ALTER TABLE---------------------------------------------------------------------------
---------------------------Renomear tabela
EXEC sp_rename 'dados_one', 'dados';
GO

---------------------------Adiciona coluna
ALTER TABLE dados ADD situacao CHAR(1);
GO

---------------------------Altera coluna (tipo)
ALTER TABLE dados ALTER COLUMN situacao CHAR(2);
GO

---------------------------Renomeia coluna
EXEC sp_rename 'dados.situacao', 'situacao_bancaria', 'COLUMN';
GO

---------------------------Remove coluna
ALTER TABLE dados DROP COLUMN situacao_bancaria;
GO

--EXCLUSÃO TABLE------------------------------------------------------------------------
---------------------------Exclusão condicional de tabela
DROP TABLE IF EXISTS dados;
GO

--EXCLUSÃO DE DATABASE------------------------------------------------------------------
---------------------------Seta outro banco de dados
USE master;
GO

---------------------------Desconexão de todos os usuários com rollback e setagem como único usuário.
ALTER DATABASE [data_one] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

---------------------------Exclusão condicional de banco de dados
DROP DATABASE IF EXISTS data_one;
GO
