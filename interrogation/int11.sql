.mode	    columns
.headers	on
.nullvalue	NULL

--Atores que participaram em todos os episódios de uma série.

SELECT Person.name
FROM Person,(
	SELECT COUNT(episodeId) AS cntCeleb, celebId
	FROM (SELECT episodeId,celebId FROM EpisodeRole WHERE episodeId IN (SELECT id FROM Episode WHERE seasonId IN (SELECT id FROM Season WHERE seriesId==14)))
	Group By celebId)
WHERE Person.id==celebId AND cntCeleb==(SELECT COUNT(id) FROM Episode WHERE seasonId IN (SELECT id FROM Season WHERE seriesId==14));
