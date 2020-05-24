.mode	    columns
.headers	on
.nullvalue	NULL

Select Person.name as CelebrityName, Production.name as ProductionName, Role.name as Role
FROM Person, Production, Role
WHERE (Person.id ,Production.id, Role.id) in (
    SELECT celebId, movieId as productionId, roleId
    FROM MovieRole
    ) or (Person.id, Production.id, Role.id) in (
    Select celebId, seriesId as productionId, roleId
    FROM (Episode, Season on seasonId = Season.Id), EpisodeRole on episodeId = Episode.id
)
Order by (Person.name);

