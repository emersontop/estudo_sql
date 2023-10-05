---#############
--Modulo 11

SELECT	LEN('Teste de função    '),				-- Não conta os espaços
		DATALENGTH('Teste de função      ')		-- Conta os espaços

--############
-- Concat
-- Queremos visualizar o nome completo de todos os clientes:

SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	CONCAT(FirstName,' ',LastName) AS 'Nome completo',
	EmailAddress AS 'E-mail'
FROM
	DimCustomer
--##################
--Dividir uma coluna me duas

SELECT LEFT('Product1111111',7)
SELECT RIGHT('Product1111111',7)

SELECT * FROM DimProduct

SELECT
	ProductName AS 'Produto',
	UnitPrice AS 'Preço',
	LEFT(StyleName,7) AS 'cod1',
	RIGHT(StyleName,7) AS 'cod2'
FROM
	DimProduct

--##################
--Replace

SELECT REPLACE('O EXCEL é o melhor','EXCEL','SQL')

--Em DimCustumer subistituir gender m por masculino e f por feminino

SELECT 
	FirstName, 
	LastName, 
	Gender, 
	REPLACE(Gender,'M','Masculino'),
	REPLACE(Gender,'F','Feminino') 
FROM 
	DimCustomer


SELECT 
	FirstName, 
	LastName, 
	Gender, 
	REPLACE(REPLACE(Gender,'M','Masculino'),'F','Feminino')
FROM 
	DimCustomer
--####################
--Translate

SELECT TRANSLATE('119.279.124.07','...','---')
--####################
--Stuff
SELECT STUFF('119.279.124.07',1,3,'---')
--####################
--UPPER
--LOWER

SELECT FirstName as 'Nome', UPPER(FirstName) as 'NOME', LOWER(FirstName) as 'nome' , EmailAddress as 'e-mail'  FROM DimCustomer

--####################
-- FORMAT

-- geral 'G'
SELECT FORMAT(5123, 'G')

-- Número
SELECT FORMAT(5123, 'N')

-- Moeda:
SELECT FORMAT(5123, 'C')

-- Formatação de datas

SELECT FORMAT(CAST('23/04/2020' AS datetime),'dd/MMM/yy')

-- ##################
-- Charindex:
-- Substring:

SELECT CHARINDEX('Gui', 'Emerson Guilherme')

SELECT SUBSTRING('Raquel Moreno', 8, 6) as 'Sobrenome'

-- ##############

--51 block 17