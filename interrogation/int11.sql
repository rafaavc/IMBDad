.mode	    columns
.headers	on
.nullvalue	NULL

--Atores que participaram em todos os episódios de uma série.

drop view if exists SeasonSeriesId;

create view SeasonSeriesId AS
SELECT id FROM Season WHERE seriesId==14; -- neste caso da serie com id = 14

SELECT Person.name
FROM Person,(
	SELECT COUNT(episodeId) AS cntCeleb, celebId
	FROM (SELECT episodeId,celebId FROM EpisodeRole WHERE episodeId IN (SELECT id FROM Episode WHERE seasonId IN SeasonSeriesId))
	Group By celebId)
WHERE Person.id == celebId AND cntCeleb == (SELECT COUNT(id) FROM Episode WHERE seasonId IN SeasonSeriesId);
