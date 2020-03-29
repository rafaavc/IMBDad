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

/*started here*/
drop table if exists Season;
drop table if exists Episode;
CREATE TABLE Season (
  id INTEGER,
  seriesId INTEGER,
  yearStarted INTEGER,
  yearFinished INTEGER,  
  PRIMARY KEY(id,seriesId),
  FOREIGN Key(seriesId) REFERENCES Series
);
CREATE TABLE Episode (
    id INTEGER,
    seasonId INTEGER,
  	PRIMARY KEY(id,seasonId),
    FOREIGN KEY(seasonId) REFERENCES Season
);
drop table if exists Actor;
drop table if exists Role;
drop table if exists SingleEpisodeActor;
drop table if exists SingleEpisodeRole;

CREATE TABLE Actor (
  celebId INTEGER,
  productionId INTEGER,
  characterName Text NOT NULL,
  characterRole Text NOT NULL,  
  PRIMARY KEY(celebID,productionId),
  FOREIGN Key(celebID) REFERENCES Celebrity,
  FOREIGN KEY(productionId)REFERENCES Production
);
CREATE TABLE Role (
  celebId INTEGER,
  productionId INTEGER,
  role Text NOT NULL,
  PRIMARY KEY(celebID,productionId),
  FOREIGN Key(celebID) REFERENCES Celebrity,
  FOREIGN KEY(productionId)REFERENCES Production
);
CREATE TABLE SingleEpisodeActor (
  celebId INTEGER,
  productionId INTEGER,
  characterName Text NOT NULL,
  characterRole Text NOT NULL,  
  PRIMARY KEY(celebID,productionId),
  FOREIGN Key(celebID) REFERENCES Celebrity,
  FOREIGN KEY(productionId)REFERENCES Production
);
CREATE TABLE SingleEpisodeRole (
  celebId INTEGER,
  productionId INTEGER,
  role Text NOT NULL,
  PRIMARY KEY(celebID,productionId),
  FOREIGN Key(celebID) REFERENCES Celebrity,
  FOREIGN KEY(productionId)REFERENCES Production
);

drop table if exists Review;
drop table if exists ReviewEpisode;
drop table if exists ReviewProduction;

CREATE TABLE Review (
  id INTEGER PRIMARY KEY,
  mail TExT,
  title Text NOT NULL,
  text Text NOT NULL,
  rating INteger NOT NULL,
  FOREIGN Key(mail) REFERENCES User
);
CREATE TABLE ReviewEpisode (
  reviewId INTEGEr,
  productionId Integer,
  title Text NOT NULL,
  text Text NOT NULL,
  rating INteger NOT NULL,
  FOREIGN Key(reviewId) REFERENCES Review,
  FOREIGN Key(productionId) REFERENCES Production,
  PRIMARY key(reviewID, productionId)
);
CREATE TABLE ReviewProduction (
  reviewId INTEGEr,
  productionId Integer,
  title Text NOT NULL,
  text Text NOT NULL,
  rating INteger NOT NULL,
  PRIMARY key(reviewID, productionId),
  FOREIGN Key(reviewId) REFERENCES Review,
  FOREIGN Key(productionId) REFERENCES Production
);

drop table if exists List;
drop table if exists BelongsToList;

CREATE TABLE List(
  id INteger PRIMARY key,
  name TExt,
  personId Integer,
  private bool,
  FOREIGN KEY(personId)REFERENCES Person
);

CREATE TABLE BelongsToList(
  listId INteger ,
  productionId Integer,
  PRIMARY key(listId,productionId),
  FOREIGN KEY(listId)REFERENCES List,
  FOREIGN KEY(productionId)REFERENCES Production
);

Drop table if EXISTS Genre;
Drop table if EXISTS BelongsToGenre;

CREATE TABLE Genre(
  name text PRIMARY KEY
);

CREATE TABLE BelongsToGenre(
  productionId INteger,
  name text,
  PRIMARY KEY(productionId,name),
  FOREIGN key (productionID) REFERENCES Production,
  FOREIGN KEY (name) REFERENCES Genre
);

Drop table if EXISTS AwardType;
Drop table if EXISTS AwardCategory;

CREATE TABLE AwardType(
  name text PRIMARY KEY
);
CREATE TABLE AwardCategory(
  name text PRIMARY KEY
);

Drop table if EXISTS ProductionAward;
Drop table if EXISTS CelebrityAward;

CREATE TABLE ProductionAward(
  productionId INteger,
  awardTypeName text,
  awardCategoryName text,
  year integer,
  PRIMARY KEY(productionId,awardTypeName,awardCategoryName),
  FOREIGN key (productionID) REFERENCES Production,
  FOREIGN KEY (awardCategoryName) REFERENCES AwardCategory,
  FOREIGN KEY (awardTypeName) REFERENCES AwardType
);

CREATE TABLE CelebrityAward(
  celebId text,
  awardTypeName text,
  awardCategoryName text,
  year integer,
  PRIMARY KEY(celebId,awardTypeName,awardCategoryName),
  FOREIGN key (celebId) REFERENCES Celebrity,
  FOREIGN KEY (awardCategoryName) REFERENCES AwardCategory,
  FOREIGN KEY (awardTypeName) REFERENCES AwardType
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