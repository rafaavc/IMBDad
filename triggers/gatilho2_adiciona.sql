
/*
Ao adicionar ou dar update a uma Award verifica se a Production já foi nomeada para essa award.
O mesmo para Celebrity.
Desta maneira, uma Production e uma Clebrity não podem ser premiados sem serem nomeados.
*/

create Trigger NomineesAwardUpdate
before UPDATE of productionId, celebId on Award
WHEN ((New.productionId not NULL) AND New.productionId not in (
        Select NomineeProduction.productionId
        FROM NomineeProduction
        WHERE New.id = NomineeProduction.awardId) or 
    (New.celebId not NULL) AND New.celebId not in (
        Select NomineeCelebrity.celebId
        FROM NomineeCelebrity
        WHERE New.id = NomineeCelebrity.awardId
    ))
Begin
    Select raise(FAIL, "Production and/or celebrity needs to be nominated before winning an Award.");
End;


create Trigger NomineesAwardInsert
before INSERT on Award
WHEN ((New.productionId not NULL) AND New.productionId not in (
        Select NomineeProduction.productionId
        FROM NomineeProduction
        WHERE New.id = NomineeProduction.awardId) or 
    (New.celebId not NULL) AND New.celebId not in (
        Select NomineeCelebrity.celebId
        FROM NomineeCelebrity
        WHERE New.id = NomineeCelebrity.awardId
    ))
Begin
    Select raise(FAIL, "Production and/or celebrity needs to be nominated before winning an Award.");
End;
