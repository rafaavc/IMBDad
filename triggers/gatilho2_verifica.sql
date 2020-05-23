.mode	    columns
.headers	on
.nullvalue	NULL


.print 'Before:'
Select * FROM Award;

-- Cria uma nomeação a uma award existente e adiciona os vencedores dessa award
INSERT INTO NomineeProduction VALUES(8, 2);
UPDATE Award SET productionId = 2 WHERE id = 8;

-- Dá erro ao criar uma Awards com vencedor ser este estar nomeado
INSERT INTO Award VALUES(16, 2000, 31, 1, 1, 23);

.print ''
.print 'After:'
Select * FROM Award;