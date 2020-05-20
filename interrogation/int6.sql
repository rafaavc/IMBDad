.mode	    columns
.headers	on
.nullvalue	NULL

-- Todos os utilizadores que deram a mesma pontuação à mesma produção / episódio




select productionId, userId, rating 
from ReviewProduction join Review on ReviewProduction.reviewId = Review.id



