.mode	    columns
.headers	on
.nullvalue	NULL

--Utilizadores que partilhem pelo menos 1 production nas suas listas.

SELECT DISTINCT Person.name, BelongsToList.productionId 
FROM Person, BelongsToList 
WHERE Person.id IN (
	SELECT DISTINCT userId 
	FROM List, BelongsToList as BL1
	WHERE  List.id IN (
        SELECT DISTINCT BL1.listId 
        FROM BelongsToList AS BL2 
        WHERE (BL1.listId != BL2.listId AND BL1.productionId==BL2.productionId)
    ) AND BL1.productionId in (
        SELECT DISTINCT BL1.productionId
        FROM BelongsToList AS BL2 
        WHERE (BL1.listId!=BL2.listId AND BL1.productionId==BL2.productionId)
    )
)
AND BelongsToList.productionId IN (
	SELECT DISTINCT BL1.productionId 
	FROM List, BelongsToList as BL1
	WHERE  List.id in (
        SELECT DISTINCT BL1.listId 
        FROM BelongsToList AS BL2 
        WHERE (BL1.listId!=BL2.listId AND BL1.productionId==BL2.productionId)
    ) AND BL1.productionId IN (
        SELECT DISTINCT BL1.productionId 
        FROM BelongsToList AS BL2 
        WHERE (BL1.listId!=BL2.listId AND BL1.productionId==BL2.productionId)
        )
	)
ORDER BY BelongsToList.productionId;
