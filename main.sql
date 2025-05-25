
-- Single Table Lab Sheet


CREATE TABLE pet 
(name VARCHAR(20), 
owner VARCHAR(20), 
species VARCHAR(20), 
sex CHAR(1), 
checkups SMALLINT, 
birth DATE, 
death DATE);


INSERT INTO pet (name,owner,species,sex,checkups,birth,death)VALUES
('Fluffy','Harold','cat','f',5,'2001-02-04',NULL),
('Claws','Gwen','cat','m',2,'2000-03-17',NULL),
('Buffy','Harold','dog','f',7,'1999-05-13',NULL),
('Fang','Benny','dog','m',4,'2000-08-27',NULL),
('Bowser','Diane','dog','m',8,'1998-08-31','2001-07-29'),
('Chirpy','Gwen','bird','f',0,'2002-09-11',NULL),
('Whistler','Gwen','bird','',1,'2001-12-09',NULL),
('Slim','Benny','snake','m',5,'2001-04-29',NULL);

-- Q1

SELECT * FROM pet;

SELECT * FROM pet WHERE sex = "m";

SELECT owner FROM pet WHERE sex = "m";

SELECT name, species, sex FROM pet WHERE species = "snake" OR species
= "bird";

SELECT owner, name FROM pet WHERE sex = "f";

SELECT name, birth FROM pet WHERE species = "dog";

SELECT owner FROM pet WHERE species = "bird";

SELECT species FROM pet WHERE sex ="f";

SELECT name, birth FROM pet WHERE species = "cat" OR species = "dog";

SELECT name, species FROM pet WHERE species = "cat" OR species = "bird" AND sex ="f";

-- Q2 

SELECT name FROM pet WHERE sex < "m";

SELECT owner, name FROM pet WHERE name LIKE "%er" OR name LIKE "%all";

SELECT name FROM pet WHERE name LIKE "%e%";

SELECT name FROM pet WHERE name NOT LIKE "%fy";

SELECT name FROM pet WHERE LENGTH(name) = 4;

-- Substring is extract 1 character from string, starting at position 1 (second attribute)

SELECT owner FROM pet WHERE SUBSTR(owner,1,1) IN ('a','b', 'c', 'd', 'e') AND 
SUBSTR(owner,-1,1) IN ('a','b', 'c', 'd', 'e');

SELECT owner FROM pet WHERE UPPER(SUBSTR(owner,1,1)) IN ('A','B', 'C', 'D', 'E') AND 
LOWER(SUBSTR(owner,-1,1)) IN ('a','b', 'c', 'd', 'e');


-- Q3
SELECT name, strftime('%m', birth)AS Month FROM pet WHERE death IS NOT NULL;

SELECT owner, name, birth, MIN(strftime('%Y',birth)) AS birth FROM pet
GROUP BY owner;

SELECT owner, AVG(checkups) AS Average_Checkups FROM pet GROUP BY owner;

SELECT species, COUNT(species) AS total_number FROM pet GROUP BY species ORDER BY total_number ASC;

--  The number of pets of each species that each owner has

SELECT owner, species, COUNT(species) AS total_num_species FROM pet GROUP BY owner,species;

-- Q3-4. The number of distinct species of pet each owner has

SELECT owner, COUNT(DISTINCT species) AS num_distinc_species FROM pet GROUP BY owner;

-- The number of pets of each gender there are in the database, where the gender is known

SELECT sex, COUNT(sex) FROM pet WHERE sex IS NOT NULL AND sex != '' GROUP BY sex;

-- The number of birds each owner has

SELECT owner, SUM(species = 'bird') AS 'number of birds' FROM pet GROUP BY owner;

--  The total number of check-ups each owner has made with all their pets

SELECT owner, SUM(checkups) AS 'Number of checkups' FROM pet GROUP BY owner;