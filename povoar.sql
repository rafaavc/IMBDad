PRAGMA foreign_keys = ON;


--PRODUCTION

INSERT INTO Production VALUES(1, "The Lord of The Rings: The Fellowship of The Ring", 2001, "A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.", "https://www.youtube.com/watch?v=V75dMMIW2B4");
INSERT INTO Production VALUES(3, "Joker", 2019, "In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.", "https://www.imdb.com/video/imdb/vi1723318041?playlistId=tt7286456&ref_=tt_ov_vi");
INSERT INTO Production VALUES(2, "Game of Thrones", 2011, "Nine noble families fight for control over the mythical lands of Westeros, while an ancient enemy returns after being dormant for thousands of years.", "https://www.imdb.com/video/imdb/vi3672620057?playlistId=tt0944947&ref_=tt_ov_vi");

INSERT INTO Movie VALUES(1, "2:02:00");
INSERT INTO Movie VALUES(3, "2:02:00");
INSERT INTO Series Values(2, 2019);
INSERT INTO Season Values(1, 2, 2011, 2011);
INSERT INTO Episode Values(1, 1, "Winter Is Coming", "A Night's Watch deserter is tracked down; Lord Eddard 'Ned' Stark learns that his mentor has died; Viserys Targaryen plots to win back the throne; Robert arrives at Winterfell with his family; Ned prepares to leave for King's Landing.", "1:02:00", "2011-10-17");

-- PERSON

INSERT INTO Person VALUES(1, "Rafael Valente Cristino", "2000-08-25");
INSERT INTO Person VALUES(2, "Joaquin Phoenix", "1974-10-28");
INSERT INTO Person VALUES(3, "Todd Philips", "1970-12-20");
INSERT INTO Person VALUES(4, "Bronson Webb", "1983-02-20");
INSERT INTO Celebrity VALUES(2, 1.73, "I like sql");
INSERT INTO Celebrity VALUES(3, 1.83, "Todd Phillips was born on December 20, 1970 in Brooklyn, New York City, New York, USA as Todd Bunzl. He is a producer and director, known for Joker (2019), A Tempo e Horas (2010) and Dias de Loucura (2003).");
INSERT INTO Celebrity VALUES(4, NULL, "Bronson Webb was born on February 20, 1983 in London, England as Bronson John Webb. He is an actor, known for RocknRolla: A Quadrilha (2008), Reino dos Céus (2005) and Expiação (2007).");
INSERT INTO User VALUES(1, "up201806680@fe.up.pt", "verysecret");

-- ACTOR && ROLE

INSERT INTO Actor VALUES(2, 3, "Joker", "Main Character");
INSERT INTO Role VALUES(3, 3, "Director");
INSERT INTO SingleEpisodeActor VALUES(4, 1, "Will", "Secondary Character"); -- The dude who broke the Night's Watch oath in the first episode

-- REVIEW

INSERT INTO Review VALUES(1, 1, NULL, NULL, 9); -- should mail be used as foreign key?
INSERT INTO ReviewProduction VALUES(1, 3);

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

-- AWARD

INSERT INTO AwardType VALUES(1, "Oscar");
INSERT INTO AwardType VALUES(2, "Grammy");
INSERT INTO AwardType VALUES(3, "Golden Globe");

INSERT INTO AwardCategory VALUES(1, "Best Performance by an Actor in a Leading Role");
INSERT INTO AwardCategory VALUES(2, "Best Performance by an Actor in a Motion Picture");

INSERT INTO CelebrityAward VALUES(2, 1, 1, 2020, 1);
INSERT INTO ProductionAward VALUES(3, 1, 1, 2020, 1);

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

select * from CelebrityAward;*/






