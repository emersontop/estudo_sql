SET NOCOUNT ON
-- M�dulo 10  Vari�veis

--########################
--Cria��o de vari�veis

SELECT 10 AS 'NUMERO'
SELECT 49.50 AS 'DECIMAL'
SELECT 'MARCOS' AS 'NOME'
SELECT '21/06/2021' AS 'DATA'

--########################
--Opera��es com numeros

SELECT 10+20 AS 'SOMA'
SELECT 20-10 AS 'SUB'
SELECT 31*40 AS 'MULTIPLICA��O'
SELECT 431.0/23 AS 'DIVIS�O'

--########################
--Opera��es com texto

SELECT 'MARCUS' + ' ' + 'EDUARDO' as 'NOME'

--########################
--Opera��es com datas

SELECT '20/06/2021' + 1			-- Resulta erro pq a 'data' ta como string/char

--########################
-- Propriedade das vari�veis - SQL_VARIANT_PROPERTY - Retorna o tipo de um vari�vel

SELECT 10 AS 'NUMERO'
SELECT 49.50 AS 'DECIMAL'
SELECT 'MARCOS' AS 'NOME'
SELECT '21/06/2021' AS 'DATA'

SELECT SQL_VARIANT_PROPERTY(10,'BaseType')
SELECT SQL_VARIANT_PROPERTY(49.50,'BaseType')
SELECT SQL_VARIANT_PROPERTY('Marcos','BaseType')
SELECT SQL_VARIANT_PROPERTY('21/06/2021','BaseType')

--##########################
--CAST Especifica o tipo de dados

SELECT CAST(21.45 AS INT)
SELECT CAST(21.45 AS FLOAT)
SELECT CAST(18.7 AS FLOAT)
SELECT CAST('15.6' AS FLOAT)
SELECT CAST('21/06/2021' AS DATETIME)

SELECT
	ProductName + '  Super' AS 'Novo Nome'
FROM
	DimProduct

--###########################
-- Fun��o FORMAT: Formatar valores no SQL o retorno do FORMAT � um texto

--A) N�mericos:
SELECT FORMAT(1000,'N')
SELECT FORMAT(1000,'G')

--B) Personalizados:
SELECT FORMAT(123456789, '###-##-####')

--C) DATA:
SELECT FORMAT(CAST('21/03/2021' AS DATETIME),'dd/MM/yyyy')
SELECT FORMAT(CAST('21/03/2021' AS DATETIME),'dd/MMM/yyyy')
SELECT FORMAT(CAST('21/03/2021' AS DATETIME),'dd/MMMM/yyyy')
SELECT FORMAT(CAST('21/03/2021' AS DATETIME),'ddd')
SELECT FORMAT(CAST('21/03/2021' AS DATETIME),'dddd')
SELECT FORMAT(CAST('21/03/2021' AS DATETIME),'MM')
SELECT FORMAT(CAST('21/03/2021' AS DATETIME),'MMMM'

--############################
--Fun��es de arredondamento

SELECT 10+20
SELECT 20-5
SELECT 31*40
SELECT 431.0/23

--########################
--ROUND

SELECT ROUND(18.1778,2)


--Truncar
SELECT ROUND(18.739130,2,1)

--FLOOR
SELECT FLOOR(18.731930)


--CEILING
SELECT CEILING(18.131930)

--###########################
--Declarar vari�veis
--DECLARE @var tipo
--SET @var = valor
--SELECT @var

DECLARE @var INT
SET @var = 10
SELECT @var

DECLARE @num FLOAT
SET @num = 1000
SELECT @num * @num
SELECT(@num)

--EXEMPLO

DECLARE @idade INT
SET @idade = 30
SELECT @idade as 'IDADE'

DECLARE @pre�o FLOAT
SET @pre�o = 10.89
SELECT @pre�o AS 'PRE�O'

DECLARE @nome VARCHAR(30)
SET @nome ='Matheus'
SELECT @nome AS 'NOME'

DECLARE @data DATETIME
SET @data = '15/06/2021'
SELECT @data AS 'DATA'

--#######################
--OP��O1

DECLARE	@var1 INT
DECLARE	@var2 INT
DECLARE	@data2 DATETIME

--OP��O2

DECLARE	@var3 INT,
		@var4 INT,
		@data5 DATETIME

--Op��o 3
DECLARE	@var6 INT =10,
		@var7 VARCHAR(30) = 'Um texto qlqr',
		@data8 DATETIME = '18/06/2021'

--#############
--EXEMPLO

DECLARE @varDesconto FLOAT
SET @varDesconto = 0.1

SELECT
	ProductKey AS 'ID',
	ProductName AS 'NAME',
	UnitPrice AS 'Pre�o Unit�rio',
	(1-@varDesconto) * UnitPrice AS 'Pre�o Com desconto'
FROM
	DimProduct

--EXEMPLO
DECLARE @dataBD DATETIME
SET @dataBD = '01/01/1980'

SELECT
	FirstName AS 'NOME',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	'Cliente' AS 'Tipo'
FROM
	DimCustomer
WHERE BirthDate >= @dataBD

UNION

SELECT
	FirstName AS 'NOME',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	'Funcion�rio' AS 'Tipo'
FROM
	DimEmployee
WHERE BirthDate >= @dataBD
ORDER BY Tipo

--##########################
--Como armazenar o resultado de um select em uam vari�vel

DECLARE @varTotalFuncionario INT
SET @varTotalFuncionario = (SELECT COUNT(*) FROM DimEmployee)
SELECT @varTotalFuncionario AS 'QUANTIDADE DE FUNCIONARIO'

DECLARE @varLojasOff INT
SET @varLojasOff = (SELECT COUNT(*) FROM DimStore WHERE DimStore.Status = 'off')
SELECT @varLojasOff AS 'Lojas Fechadas'

-- #######################
--Print para mostar o resultado da consulta

SELECT * FROM DimProduct
SELECT COUNT(*) FROM DimProduct

--EXEMPLO
SET NOCOUNT ON
DECLARE @varLojasOn INT, @varLojasOff2 INT
SET @varLojasOn = (SELECT COUNT(*) FROM DimStore WHERE DimStore.Status = 'on')
SET @varLojasOff2 = (SELECT COUNT(*) FROM DimStore WHERE DimStore.Status = 'off')
SELECT @varLojasOn AS 'Lojas aberta',@varLojasOff2 AS 'Lojas fechada'

PRINT 'O total de lojas abertas � de: ' + CAST(@varLojasOn AS VARCHAR(30))
PRINT 'O total de lojas fechadas �: ' + CAST(@varLojasOff2 AS VARCHAR(30))

--########################
--Armazer o valor de uma tabela em uma vari�vel

SELECT TOP(100) * FROM FactSales

--Qual produto que teve a maior quantidade vendida

DECLARE @varProdutoMaisVendido INT
DECLARE @varTotalMaisVendido INT

SELECT TOP(1)
	@varProdutoMaisVendido = ProductKey,
	@varTotalMaisVendido = SalesQuantity
FROM
	FactSales
ORDER BY SalesQuantity DESC

SELECT @varProdutoMaisVendido AS 'Produto mais vendido',@varTotalMaisVendido as 'TOtal mais vendido' 

PRINT @varProdutoMaisVendido 
PRINT @varTotalMaisVendido

SELECT
	ProductKey,
	ProductName
FROM
	DimProduct
WHERE ProductKey = @varProdutoMaisVendido

-- COMO ACUMULAR VALORES DENTRO DE UMA VARI�vel

SELECT
	FirstName,
	DepartmentName
FROM
	DimEmployee
WHERE DepartmentName = 'Marketing' AND Gender = 'F'

DECLARE @VarListaNomes VARCHAR(50)
SET @VarListaNomes = ''

SELECT
	@VarListaNomes = @VarListaNomes + FirstName + char(10)
From
	DimEmployee
WHERE DepartmentName = 'Marketing' AND Gender = 'F'

PRINT @VarListaNomes

--########################
--Vari�veis globais

SELECT @@SERVERNAME

SELECT @@VERSION