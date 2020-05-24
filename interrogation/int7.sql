.mode	    columns
.headers	on
.nullvalue	NULL

/*
Obter a pontuação de uma determinada produção, tendo em conta todas as reviews que foram feitas sobre a mesma.
No caso das séries, ter também em conta as reviews aos episódios
*/


Select cast(sum(rating) as float)/count(rating) as result 
From(
    Select rating, seriesId as pId 
    From (((Select seriesId, Episode.id as epId 
        From Episode, Season on Episode.seasonId = Season.id where seriesId = 39) as s,
        ReviewEpisode on s.epId = ReviewEpisode.episodeId) 
            as re, Review on re.reviewId = Review.id)
    union all
    Select rating, Production.id as pId 
    From (ReviewProduction, Production on Production.id = ReviewProduction.productionId) as rp,
        Review on Review.id = rp.reviewId where Production.id = 39);
