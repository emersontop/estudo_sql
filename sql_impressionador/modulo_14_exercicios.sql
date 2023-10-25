-- Modulo 14

-- Conteúdo - Exercicio do módulo

-- 1) Exericio:
SELECT
	*
FROM
	FactSales
	WHERE StoreKey = ( -- aqui é feito um select para trazer as keys da loja orlando. Poderia ter feito um Where, mas precisaria de um join
		SELECT
			StoreKey
		FROM
			DimStore
			Where StoreName = 'Contoso Orlando Store')

-- 2) Exercicio

SELECT
	ProductKey,
	ProductName,
	UnitPrice,
	(SELECT
			UnitPrice
		FROM
			DimProduct
			WHERE ProductKey = 1893) as 'Preço produto id = 1893'
FROM
	DimProduct
	WHERE UnitPrice > ( -- trazer o UnitPrice do produto 1893
		SELECT
			UnitPrice
		FROM
			DimProduct
			WHERE ProductKey = 1893)

-- 3) Exercicio

SELECT
	*
FROM
	DimEmployee
	WHERE DepartmentName = (
		SELECT
			DepartmentName
		FROM
			DimEmployee
			WHERE CONCAT(FirstName,' ',LastName) = 'Miguel Severino')

-- 4) Exercicio

SELECT
	CustomerKey,
	FirstName,
	LastName,
	EmailAddress,
	YearlyIncome,
	(	SELECT
			AVG(YearlyIncome)
		FROM
			DimCustomer
			Where (FirstName IS NOT NULL)) AS 'SALARIO MEDIO'
FROM
	DimCustomer
	Where (FirstName IS NOT NULL) AND ( YearlyIncome > (
		SELECT
			AVG(YearlyIncome)
		FROM
			DimCustomer
			Where (FirstName IS NOT NULL)))

-- 5) Exercicio

SELECT
	*
FROM
	DimCustomer
	WHERE CustomerKey in (
		SELECT
			FactOnlineSales.CustomerKey
		FROM
			FactOnlineSales
			WHERE PromotionKey in (
				SELECT
					PromotionKey
				FROM
					DimPromotion
					WHERE
						PromotionName = 'Asian Holiday Promotion'))

-- 6) Exercicio

SELECT
	CustomerKey,
	CompanyName
FROM
	DimCustomer
	WHERE CustomerKey in (
		SELECT
			CustomerKey
			--ProductKey,
			--COUNT(*) AS 'Quantidade de produtos comprados'
		From
			FactOnlineSales
			GROUP BY CustomerKey, ProductKey
			HAVING (COUNT(*) >= 3000))