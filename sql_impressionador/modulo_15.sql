-- Módulo15

-- Conteúdo:
-- LOOP
-- IF
-- BREAK
-- Continue

DECLARE @varContador INT
SET @varContador = 1

WHILE @varContador <= 10
BEGIN
	PRINT CONCAT('O valor do contador é: ', CAST(@varContador AS VARCHAR))
	SET @varContador = @varContador +1
END

-- Exercicio
DECLARE @varanoinicial INT, @varanofinal INT, @varQTD INT
SET @varanoinicial = 1996
SET @varanofinal = 2003

WHILE @varanoinicial <= @varanofinal
BEGIN
	SELECT
		@varQTD = COUNT(*)
	FROM
		DimEmployee
		WHERE YEAR(DimEmployee.HireDate) = @varanoinicial
	PRINT CONCAT(CAST(@varQTD as VARCHAR),' Contratados em: ', CAST(@varanoinicial AS VARCHAR))
	SET @varanoinicial =@varanoinicial + 1
END
go


DECLARE @varanoinicial INT, @varanofinal INT, @varQTD INT
SET @varanoinicial = 1996
SET @varanofinal = 2003

