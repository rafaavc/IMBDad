.mode	    columns
.headers	on
.nullvalue	NULL

--Qual a segunda celebridade que ganhou mais prémios? Sem usar max


SELECT distinct(Person.name) as Actor/Actress
FROM Person, (
    SELECT C1.CelebId AS CelebId, DENSE_RANK () OVER ( ORDER BY C1.celebIdCount Desc ) as rnk
    FROM (SELECT A1.celebId as CelebId, count(A1.celebId) as celebIdCount
            FROM Award as A1 group by celebId) C1, (
            SELECT A2.celebId as CelebId, count(A2.celebId) as celebIdCount
            FROM Award as A2 group by celebId) C2
    WHERE C1.CelebId NOT NULL AND C2.celebId NOT NULL AND C1.celebIdCount > C2.celebIdCount ) C1
WHERE Person.id = C1.CelebId AND rnk = 2;