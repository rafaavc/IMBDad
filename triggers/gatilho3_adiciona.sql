/*
Impedir alguém que não participou numa produção de ganhar um prémio.
*/

.mode	    columns
.headers	on
.nullvalue	NULL

Create View CelebsInSeries as
Select celebId, Series.productionId as productionId
From (EpisodeRole, Episode on EpisodeRole.episodeId = Episode.id, Season on Episode.seasonId = Season.id,
    Series on Season.seriesId = Series.productionId);

Create Trigger NomineesMustBePartOfProdution
Before Insert on NomineeCelebrity
when New.celebId not in (
    Select celebId
    From CelebsInSeries, NomineeProduction on CelebsInSeries.productionId = NomineeProduction.productionId
    Where New.awardId = NomineeProduction.awardId
) and New.celebId not in (
    Select celebId
    From Movie, MovieRole on Movie.productionId = MovieRole.movieId, NomineeProduction on Movie.productionId = NomineeProduction.productionId
    Where New.awardId = NomineeProduction.awardId
)
Begin
    Select raise(Fail, "Production where celebrity participates must be nominated");
End;

Create Trigger WinnersMustBePartOfProduction
Before update on Award
when (New.celebId not in (
    Select celebId
    From CelebsInSeries
    Where productionId = New.productionId
) and New.celebId not in (
    Select celebId
    From Movie, MovieRole on Movie.productionId = MovieRole.movieId
    Where Movie.productionId = New.productionId
))
Begin
    Select raise(Fail, "The celebrity must participate in the production winner, and both the production and celebrity winners must be nominated");
End;
