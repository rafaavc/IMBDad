.mode	    columns
.headers	on
.nullvalue	NULL

-- Pares de utilizadores que partilham 1 production nas suas listas.

drop view if exists UserListProduction;
drop view if exists Pairs;

create view UserListProduction as
select List.id as listId, userId, productionId
from List, BelongsToList on (id = listId);


create view Pairs as
Select distinct ULP1.userId as user1Id, ULP2.userId as user2Id, ULP1.productionId as productionId
FROM UserListProduction as ULP1, UserListProduction as ULP2 on (ULP1.productionId = ULP2.productionId and ULP1.userId != ULP2.userId)
WHERE ULP1.userId > ULP2.userId;


select User1.name as user1Name, User2.name as user2Name, Production.name
from (Person as User1 inner join Pairs on(User1.id = Pairs.user1Id))
    inner join Person as User2 on (User2.id = Pairs.user2Id) inner join Production on (Production.id = Pairs.productionId);


