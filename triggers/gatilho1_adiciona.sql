
PRAGMA case_sensitive_like=OFF;


create view EpisodeWithSeriesId as
select Episode.id as episodeId, seriesId
from Episode inner join Season on Episode.seasonId = Season.id;

create view PossibleCharacterName as
select distinct characterName 
from EpisodeRole 
where EpisodeRole.roleId = New.roleId and EpisodeRole.celebId = New.celebId and characterName is not null
    and ((select seriesId as sId1 from EpisodeWithSeriesId where EpisodeWithSeriesId.episodeId = EpisodeRole.episodeId)
        = (select seriesId as sId2 from EpisodeWithSeriesId where EpisodeWithSeriesId.episodeId = New.episodeId));


create trigger CharacterNameCheck
after insert on EpisodeRole
for each row
when New.characterName is NULL and (select name from Role where id = New.roleId) like '%character%'
begin

    Update EpisodeRole
    set characterName = (select characterName from PossibleCharacterName)
    where (select count(characterName) from PossibleCharacterName) = 1
        and EpisodeRole.roleId = New.roleId and EpisodeRole.celebId = New.celebId and characterName is null;
    
end;

