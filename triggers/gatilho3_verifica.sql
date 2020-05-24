PRAGMA foreign_keys = ON;

.mode	    columns
.headers	on
.nullvalue	NULL

.print 'Before:'
.print 'NomineeCelebrity'
select * from NomineeCelebrity;
.print ''
.print 'Award'
select * from Award;

INSERT INTO NomineeCelebrity Values(15, 30); --Dá erro porque produção não está nomeada

INSERT INTO NomineeProduction Values(15, 2);
INSERT INTO NomineeProduction Values(15, 3);

INSERT INTO NomineeCelebrity Values(15, 30); --Funciona porque produção já está nomeada

INSERT INTO NomineeCelebrity Values(15, 2); -- participa na production 3

update Award 
set productionId = 2, celebId = 2
where id = 15; -- não funciona porque a celebridade não participa no filme (mas está nomeada)

update Award 
set productionId = 2, celebId = 30
where id = 15; -- funciona porque ambos estao nomeados e a celebridade participa no filme


.print ''
.print 'After:'
.print 'NomineeCelebrity'
select * from NomineeCelebrity;
.print ''
.print 'Award'
select * from Award;
