PRAGMA foreign_keys = ON;

.mode	    columns
.headers	on
.nullvalue	NULL

.print 'Before:'
select * from NomineeCelebrity;

INSERT INTO NomineeCelebrity Values(15, 30); --Dá erro porque produção não está nomeada

INSERT INTO NomineeProduction Values(15, 2);
INSERT INTO NomineeCelebrity Values(15, 30); --Funciona porque produção já está nomeada

.print ''
.print 'After:'
select * from NomineeCelebrity;
