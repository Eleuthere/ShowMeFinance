-- Don't know how to write comments
-- To create the smf, showmefinance, database
-- Be sure to put the semicolon at the end
-- CREATE DATABASE smf ;
-- CREATE TABLE country (ISO CHAR(2) NOT NULL,
--                       countryName VARCHAR(40) NOT NULL,
--                       PRIMARY KEY (ISO)
--                       );
CREATE TABLE authority (
  authId INT UNIQUE NOT NULL,
  authShort CHAR(8),
  authLong VARCHAR(45),
  authBegin DATETIME,
  authEnd DATETIME,
  authExperimental BOOLEAN,
  PRIMARY KEY(authId)
  );
CREATE TABLE countryauthorityrelation(
  countryISO CHAR(2) NOT NULL,
  authId INT NOT NULL
);
-- SACID codes table
CREATE TABLE sacidcode (
  sacidcodeid INT UNIQUE NOT NULL,
  sacidcode CHAR(5),
  saciddescr VARCHAR(256),
  PRIMARY KEY(sacidcodeid)
);
-- TOUB code table
CREATE TABLE toubcode (
  toubcodeid INT UNIQUE NOT NULL,
  toubcode VARCHAR(3),
  toubdescr VARCHAR(15),
  PRIMARY KEY(toubcodeid)
);
-- Segmentation criteria code
CREATE TABLE segmcrit (
  segmcritid INT UNIQUE NOT NULL,
  segmcritcode VARCHAR(7) UNIQUE NOT NULL,
  segmcritdescr VARCHAR(256)
  PRIMARY KEY(segmcritid)
);
