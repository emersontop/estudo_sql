--#############
-- Modulo 10 - Manipuladno textos e datas no SQL

-- Exercicios

/*
1. Quando estamos manipulando tabelas, é importante pensar em como os dados serão apresentados em um relatório. Imagine os nomes dos produtos da tabela DimProduct.
Os textos são bem grandes e pode ser que mostrar os nomes completos dos produtos não seja a opção mais interessante, pois provavelmente não vão caber em um gráfico 
e a visualização ficará ruim.
a) Seu gestor te pede para listar todos os produtos para que seja criado um gráfico para ser apresentado na reunião diária de equipe. 
Faça uma consulta à tabela DimProduct que retorne (1) o nome do produto e (2) a quantidade de caracteres que cada produto tem, 
e ordene essa tabela do produto com a maior quantidade de caracteres para a menor.
b) Qual é a média de caracteres dos nomes dos produtos?
c) Analise a estrutura dos nomes dos produtos e verifique se seria possível reduzir o tamanho do nome dos produtos. 
(Dica: existem informações redundantes nos nomes dos produtos? Seria possível substituí-las?)
d) Qual é a média de caracteres nesse novo cenário?
*/

--A
SELECT
	DISTINCT ProductName as 'Nome do produto',
	LEN(DimProduct.ProductName) as 'Tamanho nome'
FROM
	DimProduct
ORDER BY
	'Tamanho nome' DESC
--B
SELECT
	AVG(LEN(DimProduct.ProductName)) as 'Media Tamanho nome'
FROM
	DimProduct
--C
SELECT
	DISTINCT ProductName as 'Nome do produto',
	DimProduct.ColorName,
	REPLACE(ProductName,DimProduct.ColorName,'') AS 'Nome reduzido'
FROM
	DimProduct
--D
SELECT
	AVG(LEN(REPLACE(ProductName,DimProduct.ColorName,'')))
FROM
	DimProduct

/*
2. A coluna StyleName da tabela DimProduct possui alguns códigos identificados por números distintos, que vão de 0 até 9, como pode ser visto no exemplo abaixo.
Porém, o setor de controle decidiu alterar a identificação do StyleName, e em vez de usar números, a ideia agora é passar a usar letras para substituir os números
, conforme exemplo abaixo:
0 -> A, 1 -> B, 2 -> C, 3 -> D, 4 -> E, 5 -> F, 6 -> G, 7 -> H, 8 -> I, 9 - J
É de sua responsabilidade alterar os números por letras na coluna StyleName da tabela DimProduct. Utilize uma função que permita fazer essas substituições 
de forma prática e rápida.
*/

SELECT
	StyleName,
	TRANSLATE(StyleName,'0123456789','ABCDEFGHIJ')
FROM
	DimProduct

/*


*/

SELECT
	DimEmployee.FirstName AS 'Primeiro Nome',
	DimEmployee.LastName AS 'Último Nome',
	DimEmployee.FirstName + ' ' + DimEmployee.LastName as 'Nome Completo',
	DimEmployee.EmailAddress AS 'E-mail',
	DimEmployee.BirthDate AS 'Data de Nascimento',
	SUBSTRING(DimEmployee.EmailAddress, 0, CHARINDEX('@',DimEmployee.EmailAddress)) AS 'login',
	CONCAT(DimEmployee.FirstName,DAY(DimEmployee.BirthDate)) AS SENHA

FROM
	DimEmployee

/*
4. A tabela DimCustomer possui o primeiro registro de vendas no ano de 2001.
Como forma de reconhecer os clientes que compraram nesse ano, o setor de Marketing solicitou a você que retornasse uma tabela com todos os clientes que fizeram 
a sua primeira compra neste ano para que seja enviado uma encomenda com um presente para cada um.
Para fazer esse filtro, você pode utilizar a coluna DateFirstPurchase, que contém a informação da data da primeira compra de cada cliente na tabela DimCustomer.
Você deverá retornar as colunas de FirstName, EmailAddress, AddressLine1 e DateFirstPurchase da tabela DimCustomer, considerando apenas os clientes que fizeram 
a primeira compra no ano de 2001.
*/

SELECT
	DimCustomer.FirstName,
	DimCustomer.EmailAddress,
	DimCustomer.AddressLine1,
	DimCustomer.DateFirstPurchase
FROM
	DimCustomer
	WHERE DimCustomer.DateFirstPurchase > '01/01/2001' AND DimCustomer.DateFirstPurchase < '01/01/2002'

SELECT
	DimEmployee.FirstName,
	DimEmployee.EmailAddress,
	DimEmployee.HireDate,
    DAY(HireDate) AS Dia,
    DATENAME(MONTH, HireDate) AS Mês,
    YEAR(HireDate) AS Ano

FROM
	DimEmployee

SELECT
	StoreName,
	OpenDate,
	DATEDIFF(DAY, OpenDate, GETDATE())
FROM
	DimStore
	WHERE CloseDate is null
	ORDER by