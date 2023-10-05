-- Modulo 4 comando AS Renomenando colunas (aliasing)

-- Selecionar as 3 colunas da tabelas DimProduct: ProductName, BrandName e ColorName

SELECT
	ProductName AS 'Nome do Produto',
	BrandName AS Marca,
	ColorName AS Cor
FROM
	DimProduct