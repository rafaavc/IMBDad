.mode	    columns
.headers	on
.nullvalue	NULL

PRAGMA case_sensitive_like=OFF;

-- Atores que já tenham desempenhado pelo menos 3 papéis diferentes
select celebId, count(characterName) as differentRoleCount
from (
    select celebId, characterName 
    from MovieRole
    where (
        (select name from Role where Role.id = roleId) like '%character%'
    )
    union  --union removes duplicates
    select celebId, characterName 
    from EpisodeRole
    where (
        (select name from Role where Role.id = roleId) like '%character%'
    )
)
group by celebId
having differentRoleCount >= 3;