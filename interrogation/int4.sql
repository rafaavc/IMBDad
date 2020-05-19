.mode	    columns
.headers	on
.nullvalue	NULL

--Obter a lista de celebridades que venceram pelo menos um Óscar e os seus respectivos filmes (bem como a categoria).

SELECT Person.name, Production.name, AwardCategory.name 
FROM Person, Production, AwardCategory, (
	SELECT DISTINCT Celebrity.personId AS cId, Production.id AS pId, Award.awardTypeId, Award.awardCategoryId AS aCId 
	FROM Celebrity, Production, Award 
	WHERE awardTypeId==(SELECT id FROM AwardType WHERE name LIKE "Oscar")
	AND Award.celebId==Celebrity.personId 
	AND Award.productionId==Production.id) 
WHERE Person.id==cId AND pId==Production.id AND aCId==AwardCategory.id;

