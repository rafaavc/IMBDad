/*
** Remember to check if the table exists: **
drop table if exists R1;
...
create table R1 (....);
...*/


drop table if exists Celebrity;
drop table if exists User;
drop table if exists Person; /* deleted after those to allow it to be deleted (because of foreign key)*/

create table Person (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    birthday DATE NOT NULL
);

create table Celebrity (
    personId INTEGER PRIMARY KEY,
    height REAL,
    bio TEXT,
    FOREIGN KEY(personId) REFERENCES Person
);

create table User (
    personId INTEGER PRIMARY KEY,
    mail TEXT UNIQUE,
    password NOT NULL CHECK(length(password) > 5),
    FOREIGN KEY(personId) REFERENCES Person
);

drop table if exists Movie;
drop table if exists Series;
drop table if exists Production;

create table Production (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    year INTEGER NOT NULL,
    sinopse TEXT,
    trailer BLOB
);

create table Movie (
    productionId PRIMARY KEY,
    duration TIME,
    FOREIGN KEY(productionId) REFERENCES Production
);

create table Series (
    productionId PRIMARY KEY,
    endingYear INTEGER,
    FOREIGN KEY(productionId) REFERENCES Production
);

/*
PRODUCTION TESTS

INSERT INTO Production VALUES(1, "The Lord of The Rings: The Fellowship of The Ring", 2001, "A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.", "https://www.youtube.com/watch?v=V75dMMIW2B4");
INSERT INTO Production VALUES(2, "Game of Thrones", 2011, "Nine noble families fight for control over the mythical lands of Westeros, while an ancient enemy returns after being dormant for thousands of years.", "https://www.imdb.com/video/imdb/vi3672620057?playlistId=tt0944947&ref_=tt_ov_vi");
INSERT INTO Movie VALUES(1, "2:02");
INSERT INTO Series Values(2, 2019);

select * from Production;
select * from Movie;
select * from Series
*/


/*
PERSON TESTS

INSERT INTO Person VALUES(1, "Rafael Valente Cristino", "2000-08-25");
INSERT INTO Person VALUES(2, "Rafael Valente Cristino", "2000-08-25");
INSERT INTO Celebrity VALUES(2, 1.7, "I like sql");
INSERT INTO User VALUES(1, "up201806680@fe.up.pt", "verysecret");

select * from Person;
select * from Celebrity;
select * from User;
*/
