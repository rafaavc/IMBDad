PRAGMA foreign_keys = ON;

.mode	    columns
.headers	on
.nullvalue	NULL

.print 'Before:'
select * from EpisodeRole;

INSERT INTO EpisodeRole VALUES(6, 30, 5, NULL); -- este deve aparecer com characterName = Tyrion Lannister
insert into EpisodeRole VALUES(7, 30, 5, NULL); -- este deve aparecer com characterName = Tyrion Lannister
INSERT INTO EpisodeRole VALUES(19, 21, 4, NULL); -- este deve aparecer com characterName = Irene Adler
INSERT INTO EpisodeRole VALUES(15, 23, 5, NULL); -- este não deve aparecer

.print ''
.print 'After:'
select * from EpisodeRole;
