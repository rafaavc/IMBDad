/*
** Remember to check if the table exists: **
drop table if exists R1;
...
create table R1 (....);
...*/
/* These are being 'dropped' here because they reference tables below (and those tables wouldn't be able to be deleted if they were being referenced by another) */
drop table if exists Role;
drop table if exists Actor;
drop table if exists SingleEpisodeActor;
drop table if exists SingleEpisodeRole;

drop table if exists ReviewEpisode;
drop table if exists ReviewProduction;
drop table if exists Review;

drop table if exists BelongsToList;
drop table if exists List;

Drop table if EXISTS ProductionAward;
Drop table if EXISTS CelebrityAward;

drop table if exists Celebrity;
drop table if exists User;
drop table if exists Person; /* deleted after those to allow it to be deleted (because of foreign key)*/


-- PERSON

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

Drop table if EXISTS BelongsToGenre;
Drop table if EXISTS Genre;

drop table if exists Episode;
drop table if exists Season;
drop table if exists Movie;
drop table if exists Series;
drop table if exists Production;

-- PRODUCTION

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


CREATE TABLE Season (
  id INTEGER,
  seriesId INTEGER NOT NULL,
  yearStarted INTEGER NOT NULL,
  yearFinished INTEGER,  
  PRIMARY KEY(id),
  FOREIGN Key(seriesId) REFERENCES Series
);

CREATE TABLE Episode (
    id INTEGER,
    seasonId INTEGER NOT NULL,
    name NOT NULL,
    sinopse TEXT, 
    duration INTEGER,
    airingDate DATE,
  	PRIMARY KEY(id),
    FOREIGN KEY(seasonId) REFERENCES Season
);


-- ACTOR & ROLE

CREATE TABLE Actor (
  celebId INTEGER NOT NULL,
  productionId INTEGER NOT NULL,
  characterName Text NOT NULL,
  characterRole Text NOT NULL,  
  PRIMARY KEY(celebID,productionId),
  FOREIGN KEY(celebID) REFERENCES Celebrity,
  FOREIGN KEY(productionId)REFERENCES Production
);

CREATE TABLE Role (
  celebId INTEGER NOT NULL,
  productionId INTEGER NOT NULL,
  role Text NOT NULL,
  PRIMARY KEY(celebID,productionId),
  FOREIGN KEY(celebID) REFERENCES Celebrity,
  FOREIGN KEY(productionId)REFERENCES Production
);


CREATE TABLE SingleEpisodeActor (
  celebId INTEGER NOT NULL,
  episodeId INTEGER NOT NULL,
  characterName Text NOT NULL,
  characterRole Text NOT NULL,  
  PRIMARY KEY(celebID,episodeId),
  FOREIGN KEY(celebID) REFERENCES Celebrity,
  FOREIGN KEY(episodeId)REFERENCES Production
);
CREATE TABLE SingleEpisodeRole (
  celebId INTEGER NOT NULL,
  episodeId INTEGER NOT NULL,
  role Text NOT NULL,
  PRIMARY KEY(celebID,episodeId),
  FOREIGN KEY(celebID) REFERENCES Celebrity,
  FOREIGN KEY(episodeId)REFERENCES Production
);

-- REVIEW

CREATE TABLE Review (
  id INTEGER PRIMARY KEY,
  userId INTEGER NOT NULL,
  title TEXT,
  text TEXT,
  rating INTEGER NOT NULL CHECK(rating > 0 AND rating <= 10),
  FOREIGN KEY(userId) REFERENCES User
);

CREATE TABLE ReviewEpisode (
  reviewId INTEGER PRIMARY KEY,
  productionId INTEGER NOT NULL,
  FOREIGN KEY(reviewId) REFERENCES Review,
  FOREIGN KEY(productionId) REFERENCES Production
);

CREATE TABLE ReviewProduction (
  reviewId INTEGER PRIMARY KEY,
  productionId INTEGER NOT NULL,
  FOREIGN KEY(reviewId) REFERENCES Review,
  FOREIGN KEY(productionId) REFERENCES Production
);

-- LIST

CREATE TABLE List(
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  personId INTEGER NOT NULL,
  private BOOLEAN NOT NULL,
  FOREIGN KEY(personId)REFERENCES Person
);

CREATE TABLE BelongsToList(
  listId INTEGER NOT NULL,
  productionId INTEGER NOT NULL,
  PRIMARY KEY(listId,productionId),
  FOREIGN KEY(listId)REFERENCES List,
  FOREIGN KEY(productionId)REFERENCES Production
);

-- GENRE

CREATE TABLE Genre(
  id INTEGER PRIMARY KEY,
  name TEXT UNIQUE
);

CREATE TABLE BelongsToGenre(
  productionId INTEGER NOT NULL,
  genreId INTEGER NOT NULL,
  PRIMARY KEY(productionId,genreId),
  FOREIGN KEY (productionID) REFERENCES Production,
  FOREIGN KEY (genreId) REFERENCES Genre
);

-- AWARD

Drop table if EXISTS AwardType;
Drop table if EXISTS AwardCategory;

CREATE TABLE AwardType(
  id INTEGER PRIMARY KEY,
  name TEXT UNIQUE
);
CREATE TABLE AwardCategory(
  id INTEGER PRIMARY KEY,
  name TEXT UNIQUE
);

CREATE TABLE ProductionAward(
  productionId INTEGER NOT NULL,
  awardTypeId TEXT NOT NULL,
  awardCategoryId TEXT NOT NULL,
  year INTEGER NOT NULL,
  won BOOLEAN NOT NULL, -- if false was only a nominee, true actually won
  PRIMARY KEY(productionId,awardTypeId,awardCategoryId),
  FOREIGN key (productionID) REFERENCES Production,
  FOREIGN KEY (awardCategoryId) REFERENCES AwardCategory,
  FOREIGN KEY (awardTypeId) REFERENCES AwardType
);

CREATE TABLE CelebrityAward(
  celebId TEXT NOT NULL,
  awardTypeId TEXT NOT NULL,
  awardCategoryId TEXT NOT NULL,
  year INTEGER NOT NULL,
  won BOOLEAN NOT NULL, -- if false was only a nominee, true actually won
  PRIMARY KEY(celebId,awardTypeId,awardCategoryId),
  FOREIGN key (celebId) REFERENCES Celebrity,
  FOREIGN KEY (awardCategoryId) REFERENCES AwardCategory,
  FOREIGN KEY (awardTypeId) REFERENCES AwardType
);

