PRAGMA foreign_keys = ON;


--PRODUCTION

INSERT INTO Production VALUES(1, "The Lord of The Rings: The Fellowship of The Ring", 2001, "A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.", "https://www.youtube.com/watch?v=V75dMMIW2B4");
INSERT INTO Production VALUES(3, "Joker", 2019, "In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.", "https://www.imdb.com/video/imdb/vi1723318041?playlistId=tt7286456&ref_=tt_ov_vi");
INSERT INTO Production VALUES(2, "Game of Thrones", 2011, "Nine noble families fight for control over the mythical lands of Westeros, while an ancient enemy returns after being dormant for thousands of years.", "https://www.imdb.com/video/imdb/vi3672620057?playlistId=tt0944947&ref_=tt_ov_vi");
INSERT INTO Production VALUES(4, "The Dark Knight", 2008, "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", "https://www.imdb.com/video/vi324468761?playlistId=tt0468569&ref_=tt_ov_vi");
INSERT INTO Production VALUES(5, "Breaking Bad", 2008, "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.", NULL);

INSERT INTO Movie VALUES(1, "2:02:00");
INSERT INTO Movie VALUES(3, "2:02:00");
INSERT INTO Movie VALUES(4, "2:32:00");
INSERT INTO Series Values(2, 2019);
INSERT INTO Series Values(5, 2013);
INSERT INTO Season Values(1, 2, 2011, 2011);
INSERT INTO Season Values(2, 5, 2008, 2008);
INSERT INTO Episode Values(2, 2, "Pilot", NULL, NULL, NULL);
INSERT INTO Episode VALUES(3, 2, "Felina", "Walter White makes one last attempt to secure his family's future, while also visiting some old enemies, during his final return to Albuquerque.", NULL, "2013-09-29");
INSERT INTO Episode Values(1, 1, "Winter Is Coming", "A Night's Watch deserter is tracked down; Lord Eddard 'Ned' Stark learns that his mentor has died; Viserys Targaryen plots to win back the throne; Robert arrives at Winterfell with his family; Ned prepares to leave for King's Landing.", "1:02:00", "2011-10-17");

-- PERSON

INSERT INTO Person VALUES(1, "Rafael Valente Cristino", "2000-08-25");
INSERT INTO Person VALUES(2, "Joaquin Phoenix", "1974-10-28");
INSERT INTO Person VALUES(3, "Todd Philips", "1970-12-20");
INSERT INTO Person VALUES(4, "Bronson Webb", "1983-02-20");
INSERT INTO Person VALUES(5, "Xavier Pisco", "2000-10-29");
INSERT INTO Person VALUES(6, "Heath Ledger", "1979-04-04");
INSERT INTO Person VALUES(7, "Vince Gilligan", "1967-02-10");
INSERT INTO Celebrity VALUES(2, 1.73, "I like sql");
INSERT INTO Celebrity VALUES(3, 1.83, "Todd Phillips was born on December 20, 1970 in Brooklyn, New York City, New York, USA as Todd Bunzl. He is a producer and director, known for Joker (2019), A Tempo e Horas (2010) and Dias de Loucura (2003).");
INSERT INTO Celebrity VALUES(4, NULL, "Bronson Webb was born on February 20, 1983 in London, England as Bronson John Webb. He is an actor, known for RocknRolla: A Quadrilha (2008), Reino dos Céus (2005) and Expiação (2007).");
INSERT INTO Celebrity VALUES(6, 1.85, "Heath Ledger was born on the fourth of April 1979, in Perth, Western Australia, to Sally and Kim Ledger.");
INSERT INTO Celebrity VALUES(7, 1.83, NULL);
INSERT INTO User VALUES(1, "up201806680@fe.up.pt", "http://link.to.photo", "verysecret");
INSERT INTO User VALUES(5, "up201806134@fe.up.pt", "http://link.to.photo", "password");

-- ROLE

INSERT INTO Role VALUES(1, "Director");
INSERT INTO Role VALUES(2, "Writer");
INSERT INTO Role VALUES(3, "Main Character");
INSERT INTO Role VALUES(4, "Secondary Character");
INSERT INTO ProductionRole VALUES(3, 2, 3, "Joker");
INSERT INTO EpisodeRole VALUES(1, 4, 4, "Will");
INSERT INTO ProductionRole VALUES(4, 6, 4, "Joker");
INSERT INTO ProductionRole VALUES(5, 7, 1, NULL);
INSERT INTO ProductionRole VALUES(5, 7, 2, NULL);

-- REVIEW

INSERT INTO Review VALUES(1, 1, NULL, NULL, 9);
INSERT INTO Review VALUES(2, 5, "A very thrilling episode!", NULL, 10);
INSERT INTO ReviewProduction VALUES(1, 3);
INSERT INTO ReviewEpisode VALUES(2, 1);

-- LIST

INSERT INTO List VALUES(1, "My favorite Movies and Series", 1, 1);
INSERT INTO BelongsToList VALUES(1, 1);
INSERT INTO BelongsToList VALUES(1, 2);

-- GENRE

INSERT INTO Genre VALUES(1, "Fantasy");
INSERT INTO Genre VALUES(2, "Action");
INSERT INTO Genre VALUES(3, "Comedy");
INSERT INTO Genre VALUES(4, "Romance");
INSERT INTO Genre VALUES(5, "Drama");
INSERT INTO Genre VALUES(6, "Thriller");
INSERT INTO Genre VALUES(7, "Crime");
INSERT INTO Genre VALUES(8, "Medieval");

INSERT INTO BelongsToGenre VALUES(1, 1);
INSERT INTO BelongsToGenre VALUES(1, 2);
INSERT INTO BelongsToGenre VALUES(2, 1);
INSERT INTO BelongsToGenre VALUES(2, 2);
INSERT INTO BelongsToGenre VALUES(2, 8);
INSERT INTO BelongsToGenre VALUES(3, 6);
INSERT INTO BelongsToGenre VALUES(3, 5);
INSERT INTO BelongsToGenre VALUES(3, 7);
INSERT INTO BelongsToGenre VALUES(4, 2);
INSERT INTO BelongsToGenre VALUES(4, 7);

-- AWARD

INSERT INTO AwardType VALUES(1, "Oscar");
INSERT INTO AwardType VALUES(2, "Grammy");
INSERT INTO AwardType VALUES(3, "Golden Globe");

INSERT INTO AwardCategory VALUES(1, "Best Performance by an Actor in a Leading Role");
INSERT INTO AwardCategory VALUES(3, "Best Performance by an Actor in a Supporting Role");
INSERT INTO AwardCategory VALUES(2, "Best Performance by an Actor in a Motion Picture");
INSERT INTO AwardCategory VALUES(4, "Best Motion Picture of the Year");
INSERT INTO AwardCategory VALUES(5, "Best Cinematography");

INSERT INTO Award VALUES(1, 2020, 3, 1, 1, 2);
INSERT INTO NomineeProduction VALUES(1, 3);
INSERT INTO NomineeCelebrity VALUES(1,2);
INSERT INTO Award VALUES(2, 2020, 4, 1, 3, 6);
INSERT INTO NomineeCelebrity VALUES(2, 6);
INSERT INTO NomineeProduction VALUES(2, 4);
INSERT INTO Award VALUES(3, 2002, 1, 1, 5, NULL);
INSERT INTO NomineeProduction VALUES(3, 1);



/*select * from Person;
select * from Celebrity;
select * from User;

select * from Production;
select * from Movie;
select * from Series;
select * from Season;
select * from Episode;

select * from Actor;
select * from Role;
select * from SingleEpisodeActor;

select * from Review;
select * from ReviewProduction;

select * from BelongsToList;
select * from BelongsToGenre;

select * from CelebrityAward;
select * from ProductionAward;*/






