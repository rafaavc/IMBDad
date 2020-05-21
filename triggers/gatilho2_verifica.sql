.mode	    columns
.headers	on
.nullvalue	NULL

INSERT INTO Award VALUES(8, 2015, NULL, 4, 7, NULL);
INSERT INTO Award VALUES(9, 2016, NULL, 1, 1, NULL);


Select * FROM Award;


INSERT INTO NomineeProduction VALUES(8, 2);
INSERT INTO NomineeProduction VALUES(9, 8);
INSERT INTO NomineeProduction VALUES(9, 9);

INSERT INTO NomineeCelebrity VALUES(9, 12);
INSERT INTO NomineeCelebrity VALUES(9, 13);

UPDATE Award SET productionId = 2 WHERE id = 8;
UPDATE Award SET productionId = 8, celebId = 12 WHERE id = 9;


Select * FROM Award;