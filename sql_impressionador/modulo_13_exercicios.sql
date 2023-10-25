-- Módulo 13 - CRUD

-- Conteúdo:
/*
Create
replace
Update
Drop
*/

/*
a) Crie um banco de dados chamado BD_Teste.
b) Exclua o banco de dados criado no item anterior.
c) Crie um banco de dados chamado Exercicios
*/

CREATE DATABASE BD_Teste
DROP DATABASE BD_Teste
CREATE DATABASE Exercicios

CREATE TABLE dCliente (
	ID_Cliente INT,
	Nome_Cliente VARCHAR(100),
	Data_de_Nascimento DATETIME
)

CREATE TABLE dGerente (
	ID_Gerente INT,
	Nome_Gerente VARCHAR(100),
	Data_de_Contratacao DATETIME,
	Salario FLOAT
)

CREATE TABLE fContratos (
	ID_Contrato INT,
	Data_de_Assinatura DATETIME,
	ID_Cliente INT,
	ID_Gerente INT,
	Valor_do_Contrato FLOAT
)

SELECT
	*
FROM
	dCliente,
	dGerente,
	fContratos

INSERT INTO dCliente (ID_Cliente,Nome_Cliente,Data_de_Nascimento)
Values
	(4,'Diego Cardoso', '1994-10-11')

SELECT
	*
FROM
	dCliente

