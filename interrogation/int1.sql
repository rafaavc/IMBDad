.mode	    columns
.headers	on
.nullvalue	NULL

--Celebridades que ganharam dois ou mais prémios num mesmo filme ou série.

SELECT distinct (Person.name)as Actor
FROM Person
WHERE id in (
    SELECT A1.CelebId
    FROM Award as A1, Award as A2
    WHERE A1.id != A2.id AND 
    (A1.AwardTypeId != A2.AwardTypeId OR A1.AwardCategoryId != A2.AwardCategoryId OR 
    A1.year != A2.year) AND
    A1.productionId = A2.productionId AND A1.celebId = A2.celebId
);
