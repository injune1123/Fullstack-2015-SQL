================================================
SQLite
"$" refers to command line
>>> refers to the output in command line
* natural langauges
================================================

INSTALL
=================
$brew install sqlite3
$which sqlite3
>>>/usr/bin/sqlite3

CONFIGURE
==================
*Open .sqliterc(the configuration file) in sublime or any test editter
* Enter and save the following lines
*.header on
*.mode column
*.timer on

SET UP A DATABESE
===================
$sqlite3 imdb_test.sqlite.db
$.help
>>> many details abou the database

CREATE TABLE
===================

* create a table named movies with four columns (id, name year, rank)
$ CREATE TABLE movies (
  id INTEGER PRIMARY KEY,
  name TEXT DEFAULT NULL,
  year INTEGER DEFAULT NULL,
  rank REAL DEFAULT NULL
);

* create a table named actors with four columns (id, first_name, last_name, gender)
$CREATE TABLE actors (
  id INTEGER PRIMARY KEY,
  first_name TEXT DEFAULT NULL,
  last_name TEXT DEFAULT NULL,
  gender TEXT DEFAULT NULL
);

*create a table named roles with three columns (actor_id, movie_id, role_name)
$ CREATE TABLE roles (
  actor_id INTEGER,
  movie_id INTEGER,
  role_name TEXT DEFAULT NULL
);

POPULATE TABLES
====================
* add a row of information about a movie in the movies table

$INSERT INTO movies (id,name,year,rank) VALUES(1,"Braveheart","1995","8.3");

* add a row of information about an acotor in the actors table
$INSERT INTO actors (id,first_name, last_name, gender) VALUES(1,"Mel(I)","Gibson","M");

* add a row of information into the roles table, to connect the movie and actor
INSERT INTO roles (actor_id, movie_id,role_name) VALUES(1,1,"William Wallace");

SEED THE DATABASE(DOWNLOAD AN EXISTING DATABASE)
==================================================
* download the SQlite from "https://drive.google.com/file/d/0B7NmZ0tnvX6TZDgzcEVYWjhnWEU/view"
* save it into the Fullstack folder and unzip it
* cd into the folder
$ sqlite3 imdb-large.sqlite3.db

CHECK THE TABLES AND ROLES IN A DATABASE
=========================================

$ sqlite> .tables 
>>>actors     directors_genres  movies_directors  roles
directors  movies            movies_genres

$sqlite> .schema movies
>>>CREATE TABLE "movies" (
  "id" int(11) NOT NULL DEFAULT '0',
  "name" varchar(100) DEFAULT NULL,
  "year" int(11) DEFAULT NULL,
  "rank" float DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX "movies_idx_name" ON "movies" ("name");


QUERIES
===========
WRITE QUERIES TO QUERY DATA
*  find all the movies made in the year 1902 
$sqlite> SELECT name,year FROM movies WHERE year=1902 AND rank>5;

>>>name                  year
--------------------  --------------------
Jack and the Beansta  1902
Uncle Josh at the Mo  1902
Voyage dans la lune,  1902
Run Time: real 0.560 user 0.054870 sys 0.081547


QUERIES EXERCISES
===================

1. CAR 
=========
*Find all movie-names that have the word "Car" as the first word in the name.

$ sqlite> SELECT name FROM movies WHERE name LIKE "car %";

2. BIRTHYEAR
=============
*Find all movies made in the year you were born.

$ sqlite> 
  SELECT id, name, rank,year
  FROM movies 
  WHERE year LIKE 1900

3. 1982
==========
*find out how many movies does our dataset have for the year 1982?
*AVG() - Returns the average value
*COUNT() - Returns the number of rows
*FIRST() - Returns the first value
*LAST() - Returns the last value
*MAX() - Returns the largest value
*MIN() - Returns the smallest value
*SUM() - Returns the sum

$ sqlite>
# not sure yet
SELECT name, rank, year, id,COUNT(year)
FROM movies
WHERE year = 1982
GROUP BY rank;


