.mode	    columns
.headers	on
.nullvalue	NULL

--Quais as celebridades que participaram simultaneamente em filmes e séries?

Select Person.name as Actor
FROM Person
WHERE Person.id IN (
    SELECT Celebrity.personId
    FROM (Celebrity, MovieRole on personId = celebId), Movie on MovieRole.movieId = Movie.productionId
) AND Person.id IN (
    SELECT Celebrity.personId
    FROM (((Celebrity, EpisodeRole on personId = celebId), Episode on episodeId = Episode.id), Season on seasonId = Season.id), Series on seriesId = Series.productionId
);
