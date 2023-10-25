-- Módulo 11
-- Conteúdo - Funções CASE, IIF e ISNULL

/*
- CASE WHEN ELSE
- CASE aninhado
- CASE/AND
- CASE/OR
- CASE aditivo
- IFF
- ISNULL
*/

-- #########################
-- CASE > Usado para realizr testes lógicos

/*
CASE
	WHEN teste_logico THEN resultado1
	ELSE resultado2
END
*/

DECLARE @Nota INT
SET @Nota = 7

SELECT
	CASE
		WHEN @Nota > 6 THEN 'APROVADO'
		ELSE 'REPROVADO'
	END

-- EXEMPLO VENCIMENTO DE PRODUTO

DECLARE @varDataVencimento DATETIME, @varDataAtual DATETIME
SET @varDataVencimento = '10/10/2023'
SET @varDataAtual = '06/10/2023'

SELECT
	CASE
		WHEN @varDataAtual > @varDataVencimento THEN 'Produto Vencido'
		ELSE 'Produto no Prazo'
	END

-- EXEMPLO MASCULINO E FEMININO

SELECT
	DimCustomer.CustomerKey,
	DimCustomer.FirstName,
	DimCustomer.Gender,
	CASE
		WHEN DimCustomer.Gender = 'M' THEN 'Masculino'
		WHEN DimCustomer.Gender = 'F' THEN 'Feminino'
		ELSE 'Empresa'
	END as 'Genero'
FROM
	DimCustomer