.mode	    columns
.headers	on
.nullvalue	NULL

--Quais as celebridades que participaram simultaneamente em filmes e séries? Considerando ano do filme = ano do inicio da temporada da serie

drop view if exists SimultaneousMoviesSeries;
drop view if exists CelebIds;

create view SimultaneousMoviesSeries as 
select  productionId as movieId, id as seasonId, seriesId
from Movie, Season on ((select year from Production where Production.id = Movie.productionId) = yearStarted);

create view CelebIds as
select distinct celebId, MovieRole.movieId as movieId, SimultaneousMoviesSeries.seriesId as seriesId
from SimultaneousMoviesSeries, MovieRole on (MovieRole.movieId = SimultaneousMoviesSeries.movieId)
where (
    celebId in (
        select celebId
        from SimultaneousMoviesSeries, Episode on (SimultaneousMoviesSeries.seasonId = Episode.seasonId), EpisodeRole on(Episode.id = EpisodeRole.episodeId)
        where movieId = MovieRole.movieId
    )
);

Select Person.name as celebrity, movieId, seriesId
FROM Person, CelebIds on (Person.id = CelebIds.celebId)
