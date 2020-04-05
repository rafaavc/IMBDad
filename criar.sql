/*
** Remember to check if the table exists: **
drop table if exists R1;
...
create table R1 (....);
...*/

drop table if exists ProductionRole;
drop table if exists EpisodeRole;
drop table if exists Role;

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
drop table if exists Person; 


-- PERSON

create table Person (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    birthday DATE NOT NULL
);

create table Celebrity (
    personId INTEGER PRIMARY KEY REFERENCES Person ON DELETE CASCADE ON UPDATE CASCADE,
    height REAL,
    bio TEXT
);

create table User (
    personId INTEGER PRIMARY KEY REFERENCES Person ON DELETE CASCADE ON UPDATE CASCADE,
    mail TEXT NOT NULL UNIQUE,
    profilePicture TEXT, -- link to the picture
    password NOT NULL CHECK(length(password) > 5)
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
    trailer TEXT -- link to the video
);

create table Movie (
    productionId PRIMARY KEY REFERENCES Production ON DELETE CASCADE ON UPDATE CASCADE,
    duration TIME
);

create table Series (
    productionId PRIMARY KEY REFERENCES Production ON DELETE CASCADE ON UPDATE CASCADE,
    endingYear INTEGER
);


CREATE TABLE Season (
  id INTEGER PRIMARY KEY,
  seriesId INTEGER NOT NULL REFERENCES Series ON DELETE CASCADE ON UPDATE CASCADE,
  yearStarted INTEGER NOT NULL,
  yearFinished INTEGER
);

CREATE TABLE Episode (
    id INTEGER PRIMARY KEY,
    seasonId INTEGER NOT NULL REFERENCES Season ON DELETE CASCADE ON UPDATE CASCADE,
    name NOT NULL,
    sinopse TEXT, 
    duration INTEGER,
    airingDate DATE
);


-- ROLE

CREATE TABLE Role (
  id INTEGER PRIMARY KEY,
  name text UNIQUE
);

CREATE TABLE ProductionRole (
  productionId INTEGER NOT NULL REFERENCES Production ON DELETE CASCADE ON UPDATE CASCADE,
  celebId INTEGER NOT NULL REFERENCES Celebrity ON DELETE CASCADE ON UPDATE CASCADE,
  roleId INTEGER NOT NULL REFERENCES Role ON DELETE CASCADE ON UPDATE CASCADE,
  characterName TEXT,
  PRIMARY KEY (productionId, celebId, roleId)
);

CREATE TABLE EpisodeRole (
  episodeId INTEGER NOT NULL REFERENCES Episode ON DELETE CASCADE ON UPDATE CASCADE,
  celebId INTEGER NOT NULL REFERENCES Celebrity ON DELETE CASCADE ON UPDATE CASCADE,
  roleId INTEGER NOT NULL REFERENCES Role ON DELETE CASCADE ON UPDATE CASCADE,
  characterName TEXT,
  PRIMARY KEY (episodeId, celebId, roleId)
);

-- REVIEW

CREATE TABLE Review (
  id INTEGER PRIMARY KEY,
  userId INTEGER REFERENCES User ON DELETE CASCADE ON UPDATE CASCADE,
  title TEXT,
  text TEXT,
  rating INTEGER NOT NULL CHECK(rating > 0 AND rating <= 10)
);

CREATE TABLE ReviewEpisode (
  reviewId INTEGER PRIMARY KEY REFERENCES Review ON DELETE CASCADE ON UPDATE CASCADE,
  episodeId INTEGER NOT NULL REFERENCES Episode ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ReviewProduction (
  reviewId INTEGER PRIMARY KEY REFERENCES Review ON DELETE CASCADE ON UPDATE CASCADE,
  productionId INTEGER NOT NULL REFERENCES Production ON DELETE CASCADE ON UPDATE CASCADE
);

-- LIST

CREATE TABLE List(
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  userId INTEGER REFERENCES User ON DELETE CASCADE ON UPDATE CASCADE,
  private BOOLEAN NOT NULL
);

CREATE TABLE BelongsToList(
  listId INTEGER NOT NULL REFERENCES List ON DELETE CASCADE ON UPDATE CASCADE,
  productionId INTEGER NOT NULL REFERENCES Production ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(listId,productionId)
);

-- GENRE

CREATE TABLE Genre(
  id INTEGER PRIMARY KEY,
  name TEXT UNIQUE
);

CREATE TABLE BelongsToGenre(
  productionId INTEGER NOT NULL REFERENCES Production ON DELETE CASCADE ON UPDATE CASCADE,
  genreId INTEGER NOT NULL REFERENCES Genre ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(productionId,genreId)
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
  productionId INTEGER REFERENCES Production ON DELETE CASCADE ON UPDATE CASCADE,
  awardTypeId INTEGER NOT NULL REFERENCES AwardType ON DELETE CASCADE ON UPDATE CASCADE,
  awardCategoryId INTEGER NOT NULL REFERENCES AwardCategory ON DELETE CASCADE ON UPDATE CASCADE,
  celebId INTEGER REFERENCES Celebrity ON DELETE SET NULL ON UPDATE CASCADE --- NULL when award its for the movie and not the celebrity
);

CREATE TABLE NomineeProduction (
  awardId INTEGER NOT NULL REFERENCES Award ON DELETE CASCADE ON UPDATE CASCADE,
  productionId INTEGER NOT NULL REFERENCES Production ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (awardId, productionId)
);

CREATE TABLE NomineeCelebrity (
  awardId INTEGER NOT NULL REFERENCES Award ON DELETE CASCADE ON UPDATE CASCADE,
  celebId INTEGER NOT NULL REFERENCES Celebrity ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (awardId, celebId)
);

