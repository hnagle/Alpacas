Harris Nagle
Lab 10
Stored Procedures

1) function PreReqsFor(courseNum) - Returns the immediate prerequisites for the passed-in course number.

SELECT *
	from courses

SELECT *
	from prerequisites

CREATE or REPLACE function prereqsfor(INTEGER, refcursor) RETURNS refcursor as

$$

DECLARE
	course_num INT :=$1;
	resultset refcursor :=$2;
BEGIN
	open resultset FOR
	SELECT prereqnum
	FROM prerequisites
	WHERE course_num = coursenum
	ORDER BY prereqnum DESC
	LIMIT 1;
	RETURN resultset;
END;

$$

LANGUAGE plpgsql;

SELECT prereqsfor(499, 'results');
FETCH ALL FROM results





2) function IsPreReqFor(courseNum) - Returns the courses for which the passed-in course 
number is an immediate pre-requisite.



CREATE OR REPLACE FUNCTION isprereqfor(INT, refcursor) RETURNS refcursor AS 
$$
DECLARE 
	course_num INT :=$1;
	resultset refcursor :=$2;
BEGIN
	open resultset FOR
	select coursenum
	FROM prerequisites
	WHERE course_num = prereqnum;

	return resultset;
END 
$$ 
language plpgsql;

SELECT isprereqfor(120, 'results');
FETCH ALL FROM results;
