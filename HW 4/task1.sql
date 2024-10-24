DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet (
  petname varchar(20),
  owner varchar(45),
  species varchar(45),
  gender enum('M','F'),
  birth date,
  death date,
  PRIMARY KEY (petname)
);

CREATE TABLE petEvent (
  petname varchar(20),
  eventdate date,
  eventtype varchar(15),
  remark varchar(255),
  FOREIGN KEY (petname) REFERENCES petPet(petname),
  PRIMARY KEY (petname,eventdate)
);