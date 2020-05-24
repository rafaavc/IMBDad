.mode	    columns
.headers	on
.nullvalue	NULL

Select Person.name as CelebrityName, Production.name as ProdcutionName
FROM Person, Production
WHERE (Person.id ,Production.id) in (
    SELECT celebId, movieId as productionId
    FROM MovieRole
    ) or (Person.id, Production.id) in (
    Select celebId, seriesId as productionId
    FROM (Episode, Season on seasonId = Season.Id), EpisodeRole on episodeId = Episode.id
)
Order by (Person.name);

