.mode	    columns
.headers	on
.nullvalue	NULL

--Obter a contagem de prémios por género em ordem decrescente

SELECT Genre.name as Genre, count(BelongsToGenre.productionId) AS MoviesNumber 
FROM Genre, BelongsToGenre on Genre.id = BelongsToGenre.genreId
WHERE BelongsToGenre.productionId IN (
	SELECT Production.id 
	FROM Production 
	WHERE Production.id IN (
		SELECT Production.id 
		FROM Production, Award on Production.id = Award.productionId
	)
)
GROUP BY BelongsToGenre.genreId 
ORDER BY MoviesNumber DESC;
