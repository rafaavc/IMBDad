/*
** Remember to check if the table exists: **
drop table if exists R1;
...
create table R1 (....);
...*/
/* These are being 'dropped' here because they reference tables below (and those tables wouldn't be able to be deleted if they were being referenced by another) */
drop table if exists Role;
drop table if exists ProductionRole;
drop table if exists EpisodeRole;

drop table if exists ReviewEpisode;
drop table if exists ReviewProduction;
drop table if exists Review;

drop table if exists BelongsToList;
drop table if exists List;

Drop table if EXISTS Award;
drop table if exists NomineeProduction;
drop table if exists NomineeCelebrity;


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


-- ROLE

CREATE TABLE Role (
  id INTEGER PRIMARY KEY,
  name text UNIQUE
);

CREATE TABLE ProductionRole (
  productionId INTEGER REFERENCES Production(id),
  celebId INTEGER REFERENCES Celebrity(personId),
  roleId INTEGER REFERENCES Role(id),
  characterName TEXT,
  PRIMARY KEY (productionId, celebId, roleId)/*
  FOREIGN KEY (productionId) REFERENCES Production,
  FOREIGN KEY (celebId) REFERENCES Celebrity,
  FOREIGN KEY (roleId) REFERENCES Role*/
);

CREATE TABLE EpisodeRole (
  episodeId INTEGER NOT NULL,
  celebId INTEGER NOT NULL,
  roleId INTEGER NOT NULL,
  characterName TEXT,
  PRIMARY KEY (episodeId, celebId, roleId),
  FOREIGN KEY (episodeId) REFERENCES Episode,
  FOREIGN KEY (celebId) REFERENCES Celebrity,
  FOREIGN KEY (roleId) REFERENCES Role
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

CREATE TABLE Award (
  id INTEGER PRIMARY KEY,
  year INT NOT NULL,
  productionId INTEGER NOT NULL,
  awardTypeId INTEGER NOT NULL,
  awardCategoryId INTEGER NOT NULL,
  celebId INTEGER NOT NULL,
  FOREIGN KEY (productionId) REFERENCES Production,
  FOREIGN KEY (awardTypeId) REFERENCES AwardType,
  FOREIGN KEY (awardCategoryId) REFERENCES AwardCategory,
  FOREIGN KEY (celebId) REFERENCES Celebrity
);

CREATE TABLE NomineeProduction (
  awardId INTEGER NOT NULL,
  productionId INTEGER NOT NULL,
  PRIMARY KEY (awardId, productionId),
  FOREIGN KEY (awardId) REFERENCES Award,
  FOREIGN KEY (productionId) REFERENCES Production
);

CREATE TABLE NomineeCelebrity (
  awardId INTEGER NOT NULL,
  celebId INTEGER NOT NULL,
  PRIMARY KEY (awardId, celebId),
  FOREIGN KEY (awardId) REFERENCES Award,
  FOREIGN KEY (celebId) REFERENCES Celebrity
);

