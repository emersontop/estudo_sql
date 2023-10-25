-- Módulo 12 - Exercicios 

-- Conteúdo Views

/*
a) A partir da tabela DimProduct, crie uma View contendo as informações de ProductName, ColorName, UnitPrice e UnitCost, 
da tabela DimProduct. Chame essa View de vwProdutos.
b) A partir da tabela DimEmployee, crie uma View mostrando FirstName, BirthDate, DepartmentName. Chame essa View de vwFuncionarios.
c) A partir da tabela DimStore, crie uma View mostrando StoreKey, StoreName e OpenDate. Chame essa View de vwLojas.
*/

CREATE VIEW vwProdutos AS
	SELECT
		ProductName,
		ColorName,
		UnitPrice,
		UnitCost
	FROM
		DimProduct
GO

SELECT
	*
FROM
	vwProdutos
GO

CREATE VIEW vwFuncionarios AS
	SELECT
		FirstName, BirthDate, DepartmentName
	FROM
		DimEmployee
GO

SELECT
	*
FROM
	vwFuncionarios
GO

CREATE VIEW vwLojas AS
	SELECT
		StoreKey, StoreName, OpenDate
	FROM
		DimStore
GO

SELECT
	*
FROM
	vwLojas
GO

/*
Crie uma View contendo as informações de Nome Completo (FirstName + LastName), Gênero (por extenso), 
E-mail e Renda Anual (formatada com R$). Utilize a tabela DimCustomer. Chame essa View de vwClientes.
*/

CREATE VIEW cwClientes as
SELECT
	CONCAT(FirstName,' ',LastName) AS 'Nome Completo',
	CASE
		WHEN Gender = 'M' THEN REPLACE(Gender,'M','Masculino')
		WHEN Gender = 'F' THEN REPLACE(Gender,'F','Feminino')
		ELSE 'Indefinido'
	END AS 'Genero',
	EmailAddress,
	CONCAT('R$', FORMAT(YearlyIncome, 'N2')) AS RendaAnual
FROM
	DimCustomer
go

DROP VIEW cwClientes