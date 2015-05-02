HARRIS NAGLE
Marist Swim-NET
CREATE STATEMENTS


CREATE TABLE people
(
pid 		varchar(3),   	NOT NULL
firstname 	varchar(255), 	NOT NULL
lastname 	varchar(255),   NOT NULL
dob 		varchar(255),   NOT NULL
height 		varchar(255),	NOT NULL
weight 		varchar(255),	NOT NULL
primary key (pid), 
)

CREATE TABLE coaches
(
pid 			varchar(255),	NOT NULL
coachAwardNum	varchar(255),
coachStartDate	varchar(255),
primary key (pid),
)

CREATE TABLE athletes
(
pid 			varchar(255),	NOT NULL
gradDate		varchar(255),
team 			varchar(255),	NOT NULL
primary key (pid),
)

CREATE TABLE eventmaster
(
pid 		varchar(255),	NOT NULL
eid			varchar(255),	NOT NULL
primary key (pid, eid),
)

CREATE TABLE event
(
eid					varchar(255),	NOT NULL
eventDescription	varchar(255),
primary key (eid)
)

CREATE TABLE competitions
(
cid				varchar(255),	NOT NULL
location		varchar(255),	
competitionName varchar(255),
teamScore		varchar(255),
competitionDate varchar(255),
primary key (cid)
)


CREATE TABLE competitionMaster
(
cid		varchar(255),	NOT NULL
pid		varchar(255),	NOT NULL
primary key (cid, pid),
)

CREATE TABLE toptimesscores
(
pid 		varchar(255),	NOT NULL
eid			varchar(255),	NOT NULL
timesScores varchar(255),	NOT NULL
cid 		varchar(255),
primary key (pid, eid, timesScores)
)

STORED PROCEDURES

CREATE PROCEDURE getAtheletesInfo (athletepid varchar)
RETURNS TABLE("People Id" varchar, "Firstname" varchar, "Lastname" varchar, "Date of Birth" varchar, "Height" varchar, "Weight" varchar,
BEGIN
RETURN QUERY select Distinct people.pid as "People Id", people.firstname as "Firstname", people.lastname as "Lastname", people.dob as "Date of Birth", 
       people.height as "Height", people.weight as "Weight", 
FROM people p
WHERE p.pid = athletepid
END;
$$ Language plpgsql;

Select getAthletesInfo ('06');


SECURITY 

CREATE ROLE ADMIN
GRANT SELECT, INSERT, UPDATE, ALTER
ON ALL TABLES IN SCHEMA PUBLIC
TO ADMIN

CREATE ROLE public
GRANT SELECT
ON ALL TABLES IN SCHEMA PUBLIC
TO public



VIEWS



CREATE OR REPLACE FUNCTION getAthletesInfo (varchar (255), REFCURSOR) AS
$$
DECLARE 
	athlete	varchar(255)	:= $1;
	resultset	REFCURSOR	:= $2;
BEGIN
	OPEN resultset for
		select pid, people.firstname, people.last, people.dob, people.height, people.weight
		from people
		where pid = athlete;
	RETURN resultset;
END 
$$
language plpgsql;
























