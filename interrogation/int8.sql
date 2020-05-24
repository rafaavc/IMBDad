.mode	    columns
.headers	on
.nullvalue	NULL

--Utilizadores que partilhem pelo menos 1 production nas suas listas.

drop view if exists DiferentListsWithSameProduction;

Create View DiferentListsWithSameProduction as 
SELECT DISTINCT userId, productionId
FROM List, BelongsToList as BL1
WHERE  List.id IN (
    SELECT DISTINCT BL1.listId 
    FROM BelongsToList AS BL2 
    WHERE (BL1.listId != BL2.listId AND BL1.productionId==BL2.productionId)
) AND BL1.productionId in (
    SELECT DISTINCT BL1.productionId
    FROM BelongsToList AS BL2 
    WHERE (BL1.listId!=BL2.listId AND BL1.productionId==BL2.productionId)
);

SELECT DISTINCT Person.name as PersonName, Production.name as ProductionName 
FROM BelongsToList, Production on BelongsToList.productionId = Production.Id, Person 
WHERE Person.id IN (
	SELECT userId
    FROM DiferentListsWithSameProduction
)
AND BelongsToList.productionId IN (
    SELECT productionId
    FROM DiferentListsWithSameProduction
)
ORDER BY BelongsToList.productionId;
