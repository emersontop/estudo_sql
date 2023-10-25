--#############
-- Modulo 10 - Manipuladno textos e datas no SQL

-- Exercicios

/*
1. Quando estamos manipulando tabelas, � importante pensar em como os dados ser�o apresentados em um relat�rio. Imagine os nomes dos produtos da tabela DimProduct.
Os textos s�o bem grandes e pode ser que mostrar os nomes completos dos produtos n�o seja a op��o mais interessante, pois provavelmente n�o v�o caber em um gr�fico 
e a visualiza��o ficar� ruim.
a) Seu gestor te pede para listar todos os produtos para que seja criado um gr�fico para ser apresentado na reuni�o di�ria de equipe. 
Fa�a uma consulta � tabela DimProduct que retorne (1) o nome do produto e (2) a quantidade de caracteres que cada produto tem, 
e ordene essa tabela do produto com a maior quantidade de caracteres para a menor.
b) Qual � a m�dia de caracteres dos nomes dos produtos?
c) Analise a estrutura dos nomes dos produtos e verifique se seria poss�vel reduzir o tamanho do nome dos produtos. 
(Dica: existem informa��es redundantes nos nomes dos produtos? Seria poss�vel substitu�-las?)
d) Qual � a m�dia de caracteres nesse novo cen�rio?
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
2. A coluna StyleName da tabela DimProduct possui alguns c�digos identificados por n�meros distintos, que v�o de 0 at� 9, como pode ser visto no exemplo abaixo.
Por�m, o setor de controle decidiu alterar a identifica��o do StyleName, e em vez de usar n�meros, a ideia agora � passar a usar letras para substituir os n�meros
, conforme exemplo abaixo:
0 -> A, 1 -> B, 2 -> C, 3 -> D, 4 -> E, 5 -> F, 6 -> G, 7 -> H, 8 -> I, 9 - J
� de sua responsabilidade alterar os n�meros por letras na coluna StyleName da tabela DimProduct. Utilize uma fun��o que permita fazer essas substitui��es 
de forma pr�tica e r�pida.
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
	DimEmployee.LastName AS '�ltimo Nome',
	DimEmployee.FirstName + ' ' + DimEmployee.LastName as 'Nome Completo',
	DimEmployee.EmailAddress AS 'E-mail',
	DimEmployee.BirthDate AS 'Data de Nascimento',
	SUBSTRING(DimEmployee.EmailAddress, 0, CHARINDEX('@',DimEmployee.EmailAddress)) AS 'login',
	CONCAT(DimEmployee.FirstName,DAY(DimEmployee.BirthDate)) AS SENHA

FROM
	DimEmployee

/*
4. A tabela DimCustomer possui o primeiro registro de vendas no ano de 2001.
Como forma de reconhecer os clientes que compraram nesse ano, o setor de Marketing solicitou a voc� que retornasse uma tabela com todos os clientes que fizeram 
a sua primeira compra neste ano para que seja enviado uma encomenda com um presente para cada um.
Para fazer esse filtro, voc� pode utilizar a coluna DateFirstPurchase, que cont�m a informa��o da data da primeira compra de cada cliente na tabela DimCustomer.
Voc� dever� retornar as colunas de FirstName, EmailAddress, AddressLine1 e DateFirstPurchase da tabela DimCustomer, considerando apenas os clientes que fizeram 
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
    DATENAME(MONTH, HireDate) AS M�s,
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