.mode	    columns
.headers	on
.nullvalue	NULL

--Quais as celebridades que participaram simultaneamente em filmes e séries?

Select Person.name
FROM Person
WHERE Person.id IN (
    SELECT Celebrity.personId
    FROM (Celebrity, ProductionRole on personId = celebId), Movie on ProductionRole.productionId = Movie.productionId
) AND Person.id IN (
    SELECT Celebrity.personId
    FROM (Celebrity, ProductionRole on personId = celebId), Series on ProductionRole.productionId = Series.productionId
);
