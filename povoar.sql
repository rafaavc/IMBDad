PRAGMA foreign_keys = ON;


--PRODUCTION

INSERT INTO Production VALUES(1, "The Lord of The Rings: The Fellowship of The Ring", 2001, "A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.", "https://www.youtube.com/watch?v=V75dMMIW2B4");
INSERT INTO Production VALUES(2, "Game of Thrones", 2011, "Nine noble families fight for control over the mythical lands of Westeros, while an ancient enemy returns after being dormant for thousands of years.", "https://www.imdb.com/video/imdb/vi3672620057?playlistId=tt0944947&ref_=tt_ov_vi");
INSERT INTO Movie VALUES(1, "2:02");
INSERT INTO Series Values(2, 2019);

select * from Production;
select * from Movie;
select * from Series;

--PERSON

INSERT INTO Person VALUES(1, "Rafael Valente Cristino", "2000-08-25");
INSERT INTO Person VALUES(2, "Rafael Valente Cristino", "2000-08-25");
INSERT INTO Celebrity VALUES(2, 1.7, "I like sql");
INSERT INTO User VALUES(1, "up201806680@fe.up.pt", "verysecret");

select * from Person;
select * from Celebrity;
select * from User;
