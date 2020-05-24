PRAGMA foreign_keys = ON;

drop trigger if exists NomineesMustBePartOfProdution;
drop trigger if exists WinnersMustBePartOfProductionAndBeNominated;
drop view if exists CelebsInSeries;
