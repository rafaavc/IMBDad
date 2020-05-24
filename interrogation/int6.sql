.mode	    columns
.headers	on
.nullvalue	NULL

-- Obter pares de utilizadores que deram a mesma pontuação a uma produção

drop view if exists reviewIds;
drop view if exists Pairs;

create view reviewIds as
Select ReviewProduction.reviewId
FROM ReviewProduction
WHERE ReviewProduction.productionId = 39;   -- this is the production selector

create view Pairs as
Select distinct R1.userId as user1Id, R2.userId as user2Id, R2.rating as rating
FROM Review as R1, Review as R2 on (R1.rating = R2.rating and R1.userId != R2.userId)
WHERE R1.id in reviewIds and R2.id in reviewIds;


select Pairs.user1Id, User1.name as user1Name, Pairs.user2Id, User2.name as user2Name, Pairs.rating
from
(Person as User1  inner join Pairs on(User1.id = Pairs.user1Id))
inner join Person as User2 on (User2.id = Pairs.user2Id);


/*Select Person.id as userId, Person.name as userName, Review.rating 
from Person, Review 
where Person.id=Review.userId AND Review.id in (
    Select  R1.id
    FROM Review as R1, Review as R2 on (R1.rating = R2.rating and R1.userId != R2.userId)
    WHERE R1.id in reviewIds and R2.id in reviewIds
);*/

