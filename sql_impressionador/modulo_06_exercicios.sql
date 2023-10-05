-- EXERCICIOS
--exercicio 1
SELECT TOP 100
	*
FROM
	FactSales AS FactS
	LEFT JOIN DimChannel AS DChannel
	ON Facts.channelKey = DChannel.ChannelKey

SELECT
	DChannel.ChannelName AS 'Canal de vendas',
	SUM(SalesQuantity) AS 'Vendas por canal'
FROM
	FactSales AS FactS
	LEFT JOIN DimChannel AS DChannel
	ON Facts.channelKey = DChannel.ChannelKey
GROUP BY DChannel.ChannelName

SELECT
	DS.StoreName AS 'Nome Loja',
	SUM(SalesQuantity) AS 'QTD vendida',
	SUM(ReturnQuantity) AS 'QTD devolvida'
FROM
	FactSales AS FS
	LEFT JOIN DimStore AS DS
	ON FS.StoreKey = DS.StoreKey
GROUP BY DS.StoreName

SELECT
	DChannel.ChannelName AS 'Canal de vendas',
	SUM(SalesAmount) AS 'Vendas por canal'
FROM
	FactSales AS FactS
	LEFT JOIN DimChannel AS DChannel
	ON Facts.channelKey = DChannel.ChannelKey
WHERE FactS.DateKey BETWEEN '20070101' AND '20071231'
GROUP BY DChannel.ChannelName

-- exercicio 2

SELECT
	DP.ProductName AS 'Nome do produto',
	SUM(SalesAmount) AS 'Total vendido'
FROM
	FactSales AS FS
	LEFT JOIN DimProduct AS DP
	ON FS.ProductKey = DP.ProductKey
GROUP BY DP.ProductName
HAVING SUM(SalesAmount) > 50000000
ORDER BY SUM(SalesAmount) DESC

SELECT TOP(10)
	DP.ProductName AS 'Nome do produto',
	SUM(SalesAmount) AS 'Total vendido'
FROM
	FactSales AS FS
	LEFT JOIN DimProduct AS DP
	ON FS.ProductKey = DP.ProductKey
GROUP BY DP.ProductName
ORDER BY SUM(SalesAmount) DESC

--exercicio 3
SELECT TOP(10)
	*
FROM
	FactOnlineSales


SELECT TOP(10)
	CustomerKey AS 'ID cliente',
	SUM(SalesQuantity) AS 'Quantidade vendida'
FROM
	FactOnlineSales 
GROUP BY CustomerKey
ORDER BY SUM(SalesQuantity) DESC

SELECT TOP(3)
	ProductKey AS 'ID Produto',
	SUM(SalesQuantity) AS 'QTD vendida'
FROM
	FactOnlineSales
WHERE FactOnlineSales.CustomerKey = 19037
GROUP BY ProductKey
ORDER BY SUM(SalesQuantity) DESC

-- exercicio 4
SELECT 
	BrandName AS 'Nome da marca',--estou agrupando pelo nome da marca
	COUNT(BrandName) AS 'Quantidade de produtos'
FROM
	DimProduct
GROUP BY BrandName

SELECT
	ClassName AS 'Categoria',
	AVG(UnitPrice) AS 'Média de preço'
FROM
	DimProduct
GROUP BY ClassName

SELECT
	DimProduct.ColorName AS 'Cores',
	SUM(DimProduct.Weight) AS 'Total peso'
FROM
	DimProduct
GROUP BY DimProduct.ColorName

--Exercicio5
SELECT
	DimProduct.StockTypeName AS 'Tipo de produto',
	SUM(DimProduct.Weight) AS 'Total Peso'
FROM 
	DimProduct
WHERE
	DimProduct.BrandName = 'Contoso'
GROUP BY DimProduct.StockTypeName
ORDER BY SUM(DimProduct.Weight) DESC
--Exercicio 6
SELECT
	DimProduct.BrandName AS 'Nome da marca',
	COUNT(DISTINCT DimProduct.ColorID)
FROM
	DimProduct
GROUP BY DimProduct.BrandName

--Exercicio 7
SELECT
	DimCustomer.Gender AS 'Sexo',
	COUNT(DimCustomer.Gender),
	AVG(DimCustomer.YearlyIncome) AS 'Media salarial'
FROM
	DimCustomer
GROUP by DimCustomer.Gender
HAVING COUNT(DimCustomer.Gender) >0

--Exercicio8
SELECT
	DimCustomer.Education AS 'Nível escolar',
	COUNT(DimCustomer.Education) AS 'Quantidade de cliente',
	AVG(DimCustomer.YearlyIncome) AS 'Média salarial'
FROM
	DimCustomer
WHERE
	DimCustomer.Education IS NOT NULL
GROUP BY
	DimCustomer.Education

--Exercicio9
