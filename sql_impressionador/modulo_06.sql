--Aula 1
SELECT
	BrandName,
	COUNT(*) AS 'Quantidade de produtos'
FROM
	DimProduct
GROUP BY BrandName

--Aula2
SELECT
	StoreType,
	SUM(EmployeeCount)
FROM
	DimStore
GROUP BY StoreType

SELECT
	BrandName,
	AVG(UnitCost) AS 'M�dia de custos'
FROM
	DimProduct
GROUP by BrandName
ORDER BY 'M�dia de custos' ASC

SELECT
	ClassName,
	MAX(UnitPrice) AS 'Max Pre�o'
FROM
	DimProduct
GROUP BY ClassName

--Aula 3
SELECT
	StoreType,
	SUM(EmployeeCount) AS 'QTD Funcionarios'
FROM
	DimStore
GROUp BY StoreType
ORDER BY 'QTD Funcionarios'

--Aula 4
SELECT
	ColorName As 'Cor do produto',
	Count(*) AS 'Total de Produtos'
FROM
	DimProduct
WHERE BrandName = 'Contoso'
GROUP BY ColorName

--Aula 5
SELECT
	BrandName AS 'Nome da Marca',
	COUNT(BrandName) AS 'Total por marca'
FROM
	DimProduct
GROUP BY BrandName
HAVING COUNT(BrandName) > 200
ORDER BY COUNT(BrandName)
