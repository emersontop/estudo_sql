-- aula
--###############
SELECT TOP(100)
	*
FROM
	FactSales

--###############
SELECT
	*
FROM
	DimChannel
--###############
SELECT
	DimChannel.ChannelName,
	SUM(FactSales.SalesQuantity) AS 'QTD Sales'
FROM
	FactSales
	LEFT JOIN DimChannel on FactSales.channelKey = DimChannel.ChannelKey
GROUP BY DimChannel.ChannelName

--################
--CROSS JOINS

--################
--MULTIPLOS JOINS
--SELECT 1
SELECT
	ProductKey,
	ProductName,
	ProductSubcategoryKey
FROM
	DimProduct
-- 2517 Linhas
--SELECT 2

SELECT
	ProductSubcategoryKey,
	ProductSubcategoryName,
	ProductCategoryKey
FROM
	DimProductSubcategory
-- 44 Linhas
--SELECT 3

SELECT
	ProductCategoryKey,
	ProductCategoryName
FROM
	DimProductCategory
-- 8 Linhas

SELECT
	ProductKey,
	ProductName,
	ProdSub.ProductSubcategoryName,
	ProdCat.ProductCategoryName
FROM
	DimProduct as Prod
LEFT JOIN DimProductSubcategory as ProdSub 
	on Prod.ProductSubcategoryKey = ProdSub.ProductSubcategoryKey
		LEFT JOIN DimProductCategory as ProdCat 
			on ProdSub.ProductCategoryKey = ProdCat.ProductCategoryKey

--################
--UNION Junta tabelas de mesma estrutura, mas exclui linhas duplicadas
--UNION ALL Junta tabelas de mesma estrutura, mantem exclui linhas duplicadas



