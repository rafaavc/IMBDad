.mode	    columns
.headers	on
.nullvalue	NULL

.print 'Before:'
Select * FROM Award;

-- Cria uma nomeação a uma award existente e adiciona os vencedores dessa award
INSERT INTO NomineeProduction VALUES(9, 8);
INSERT INTO NomineeProduction VALUES(9, 9);

INSERT INTO NomineeCelebrity VALUES(9, 12);
INSERT INTO NomineeCelebrity VALUES(9, 13);

UPDATE Award SET productionId = 8, celebId = 14 WHERE id = 9; -- Não deve alterar e deve dar erro
UPDATE Award SET productionId = 8, celebId = 12 WHERE id = 9;  -- Deve alterar

INSERT INTO Award VALUES(16, 2000, 31, 1, 1, 23); -- Não deve alterar e deve dar erro

.print ''
.print 'After:'
Select * FROM Award;