-- Módulo 10  Variáveis

--########################
-- Lista de exercicios

/*
1) Exercicio
Declare 4 variáveis inteiras. Atribua os seguintes valores a elas:
valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7
a) Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame essa variável de soma.
b) Crie uma nova variável para armazenar o resultado da subtração entre valor3 e valor 4. Chame essa variável de subtracao.
c) Crie uma nova variável para armazenar o resultado da multiplicação entre o valor 1 e o valor4. Chame essa variável de multiplicacao.
d) Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame essa variável de divisao. Obs: O resultado deverá estar em decimal, e não em inteiro.
e) Arredonde o resultado da letra d) para 2 casas decimais.
*/

DECLARE @var1 INT, @var2 INT, @var3 INT, @var4 INT
SET @var1 = 10
SET @var2 = 5
SET @var3 = 34
SET @var4 = 7

DECLARE @soma INT
SET @soma = @var1 + @var2
SELECT @soma AS 'SOMA'

DECLARE @subtracao INT
SET @subtracao = @var3 - @var4
SELECT @subtracao as 'subtração'

DECLARE @multiplicacao INT
SET @multiplicacao = @var1 * @var4
SELECT @multiplicacao AS 'Multiplicacao'

DECLARE @divisao FLOAT
SET @divisao = CAST(@var3 AS FLOAT)/@var4
SELECT CAST(@divisao AS FLOAT) AS '@divisao'

/*
2) Exercicio
Para cada declaração das variáveis abaixo, atenção em relação ao tipo de dado que deverá ser especificado.
a) Declare uma variável chamada ‘produto’ e atribua o valor de ‘Celular’.
b) Declare uma variável chamada ‘quantidade’ e atribua o valor de 12.
c) Declare uma variável chamada ‘preco’ e atribua o valor 9.99.
d) Declare uma variável chamada ‘faturamento’ e atribua o resultado da multiplicação entre ‘quantidade’ e ‘preco’.
e) Visualize o resultado dessas 4 variáveis em uma única consulta, por meio do SELECT.
*/

DECLARE @produto VARCHAR(30)
SET @produto = 'Celular'
--SELECT @produto
--SELECT SQL_VARIANT_PROPERTY(@produto,'BaseType')

DECLARE @quantidade INT
SET @quantidade = 12
--SELECT @quantidade
--SELECT SQL_VARIANT_PROPERTY(@quantidade,'BaseType')

DECLARE @preco FLOAT
SET @preco = 9.99
--SELECT @preco
--SELECT SQL_VARIANT_PROPERTY(@preco,'BaseType')

DECLARE @faturamento FLOAT
SET @faturamento = @preco * @quantidade
--SELECT @faturamento
--SELECT SQL_VARIANT_PROPERTY(@faturamento,'BaseType')

SELECT	@faturamento AS 'Faturamento',
		@quantidade AS 'Quantidade', 
		@preco AS 'Preço',
		@produto AS 'Produto'

/*
3) Exercicio
3. Você é responsável por gerenciar um banco de dados onde são recebidos dados externos de usuários. Em resumo, esses dados são:
- Nome do usuário
- Data de nascimento
- Quantidade de pets que aquele usuário possui
Você precisará criar um código em SQL capaz de juntar as informações fornecidas por este usuário. Para simular estes dados, crie 3 variáveis, chamadas: 
nome, data_nascimento e num_pets. Você deverá armazenar os valores ‘André’, ‘10/02/1998’ e 2, respectivamente.
O resultado final a ser alcançado é mostrado no print abaixo:
*/

DECLARE @nome VARCHAR(30), @data_nascimento DATETIME, @num_pets INT
SET @nome = 'André'
SET @data_nascimento = '10/02/1998'
SET @num_pets = 2

DECLARE @frase VARCHAR(100)
SET @frase = 'Meu nome é ' + @nome +', nasci em ' + FORMAT(@data_nascimento,'dd/MM/yyyy') + 'e tenho ' + cast(@num_pets AS VARCHAR) + ' pets'
SELECT @frase

/*
4) Exercicio
4. Você acabou de ser promovido e o seu papel será realizar um controle de qualidade sobre as lojas da empresa.
A primeira informação que é passada a você é que o ano de 2008 foi bem complicado para a empresa, pois foi quando 
duas das principais lojas fecharam. O seu primeiro desafio é descobrir o nome dessas lojas que fecharam no ano de 2008,
para que você possa entender o motivo e mapear planos de ação para evitar que outras lojas importantes tomem o mesmo caminho.
O seu resultado deverá estar estruturado em uma frase, com a seguinte estrutura:
‘As lojas fechadas no ano de 2008 foram: ’ + nome_das_lojas
Obs: utilize o comando PRINT (e não o SELECT!) para mostrar o resultado.
*/

DECLARE @inicio_frase VARCHAR(100), @loja1 VARCHAR(100), @loja2 VARCHAR(100)
SET @inicio_frase = 'As lojas fechadas no ano de 2008 foram: '

SELECT TOP(1) @loja1 = StoreName FROM DimStore WHERE CloseDate IS NOT NULL AND (CloseDate > '31/12/2007' AND CloseDate < '01/01/2009') Order by StoreName 
SELECT TOP(1) @loja2 = StoreName FROM DimStore WHERE CloseDate IS NOT NULL AND (CloseDate > '31/12/2007' AND CloseDate < '01/01/2009') Order by StoreName DESC 

SET @inicio_frase = @inicio_frase + @loja1 + @loja2

PRINT(@inicio_frase)

/*
SELECT 
	SQL_VARIANT_PROPERTY(CloseDate,'BaseType')
FROM 
	DimStore 
	WHERE CloseDate IS NOT NULL

DECLARE @data_fechamento DATETIME
SET @data_fechamento = '31/12/2007'
SELECT @data_fechamento
SELECT SQL_VARIANT_PROPERTY(@data_fechamento,'BaseType')
*/

/*
5) Exercicio
5. Você precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para uma subcategoria específica: ‘Lamps’.
Utilize o conceito de variáveis para chegar neste resultado.
*/

DECLARE @Sub VARCHAR(100), @nome_lista VARCHAR(100)
SET @Sub = 'Lamps'
SET @nome_lista = 'Lista de produtos' + @Sub

SELECT 
	DimProduct.ProductName
FROM 
	DimProduct
	LEFT JOIN DimProductSubcategory on DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
	WHERE DimProductSubcategory.ProductSubcategoryName = @Sub