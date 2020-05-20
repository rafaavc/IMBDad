.mode	    columns
.headers	on
.nullvalue	NULL

/*
Obter a pontuação de uma determinada produção, tendo em conta todas as reviews que foram feitas sobre a mesma. 
(Para séries: (nEpisodeReview*avgEpisodeReview + nProductionReview*avgProductionReview)/(nEpisodeReview + nProductionReview), 
para filmes: avgProductionReview)
*/

-- NOT FINISHED YET

/*select (nEpisodeReview * avgEpisodeReview + nProductionReview*avgProductionReview)/(nEpisodeReview + nProductionReview) as result
from (*/
    select rating, title, id from
        (((select seriesId, Episode.id as episodeId from Episode inner join Season on Episode.seasonId = Season.id where seriesId = 14) as s
            inner join ReviewEpisode on s.episodeId = ReviewEpisode.episodeId) 
            as re inner join Review on re.reviewId = Review.id)
--)
