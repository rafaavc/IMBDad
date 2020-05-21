.mode	    columns
.headers	on
.nullvalue	NULL

-- Todos os utilizadores que deram a mesma pontuação à mesma produção / episódio


Select Person.name, Review.rating 
from Person, Review 
where Person.id=Review.userId AND Review.id in (
    Select  R1.id
    FROM Review as R1, Review as R2 on (R1.rating = R2.rating and R1.userId != R2.userId)
    WHERE R1.id in (
        Select ReviewProduction.reviewId
        FROM ReviewProduction
        WHERE ReviewProduction.productionId = 39
    ) and R2.id in (
        Select ReviewProduction.reviewId
        FROM ReviewProduction
        WHERE ReviewProduction.productionId = 39
    )
);
