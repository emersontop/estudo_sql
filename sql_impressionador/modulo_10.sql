--#############
-- Modulo 11 - Manipuladno textos e datas no SQL

-- Conteúdo:
/*
- LEN e DATALENGHT
- CONCAT
- LEFT e RIGHT
- REPLACE, TRANSLATE e STUFF
- UPPER e LOWER
- FORMAT
- CHARINDEX
- SUBSTRING
- TRIM, LTRIM e RTRIM
- YEAR, MONTH e DAY
- DATEFROMPARTS
- GETDATE, SYSDATETIME
- DATEPART
- DATENAME
- DATEADD
- DATEDIFF
*/

-- ##########
-- LEN e DATALENGHT
SELECT	LEN('Teste de função    ') AS 'LEN',				-- Não conta os espaços
		DATALENGTH('Teste de função      ') AS 'DATALENGHT'		-- Conta os espaços

--##################
-- CONCAT >> Juntar 2 ou mais textos.

SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	CONCAT(FirstName,' ',LastName) AS 'Nome completo',
	EmailAddress AS 'E-mail'
FROM
	DimCustomer

--##################
-- LEFT e RIGHT
-- Extrai uma determinada quantidade de caracteres de um texto

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
--REPLACE >> Subistituir um texto específico por outro

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
--TRANSLATE >> Subistitui uma ûm vetor de caracteres

SELECT TRANSLATE('119.279.124.07','...','---')

--####################
--STUFF >> Substitui um range de caracteres
SELECT STUFF('119.279.124.07',1,3,'---')

--####################
--UPPER >> Miscucula
--LOWER >> minuscula

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
-- CHARINDEX >> index de início de um caracter
-- SUBSTRING >> Selecionar um trexo pela posição de um string

SELECT CHARINDEX('Gui', 'Emerson Guilherme')

SELECT SUBSTRING('Raquel Moreno', 8, 6) as 'Sobrenome'

DECLARE @varnome VARCHAR(100)
SET @varnome = 'Luis Dias'
SELECT SUBSTRING(@varnome, CHARINDEX(' ',@varnome) +1 , 6) as 'Sobrenome'

-- ##################
-- - TRIM, LTRIM e RTRIM

DECLARE @Varcodigo VARCHAR(50)
SET @Varcodigo = '    ABC123 '

SELECT 
	TRIM(@Varcodigo) as 'TRIM',
	LTRIM(@Varcodigo) as 'LTRIM',
	RTRIM(@Varcodigo) as 'RTRIM'

SELECT 
	DATALENGTH(TRIM(@Varcodigo)) as 'TRIM',
	DATALENGTH(LTRIM(@Varcodigo)) as 'LTRIM',
	DATALENGTH(RTRIM(@Varcodigo)) as 'RTRIM'

-- ##################
-- - YEAR, MONTH e DAY

DECLARE @vardata DATETIME
SET @vardata = '18/05/2020'

SELECT
	DAY(@vardata) as 'Dia',
	MONTH(@vardata) as 'Mês',
	YEAR(@vardata) as 'Ano'

--####################
-- DATEFROMPARTS

DECLARE @varDia INT, @varMes INT, @varAno INT
SET @varDia = 15
SET @varMes = 10
SET @varAno = 2017

SELECT
	DATEFROMPARTS(@varAno, @varMes, @varDia) AS 'Data'

-- ####################
-- GETDATE
-- SYSDATETIME
-- DATEPART