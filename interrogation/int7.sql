.mode	    columns
.headers	on
.nullvalue	NULL

/*
Obter a pontuação de uma determinada produção, tendo em conta todas as reviews que foram feitas sobre a mesma.
No caso das séries, ter também em conta as reviews aos episódios
*/


select cast(sum(rating) as float)/count(rating) as result from
    (select rating, seriesId as pId from
        (((select seriesId, Episode.id as epId from Episode inner join Season on Episode.seasonId = Season.id where seriesId = 39) as s
            inner join ReviewEpisode on s.epId = ReviewEpisode.episodeId) 
            as re inner join Review on re.reviewId = Review.id)
    union all
    select rating, Production.id as pId from
        (ReviewProduction inner join Production on Production.id = ReviewProduction.productionId) as rp
            inner join Review on Review.id = rp.reviewId where Production.id = 39);
