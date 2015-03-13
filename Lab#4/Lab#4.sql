Harris Nagle
Lab#4
The Subqueries Sequel 
ALPACAS



1) Get the cities of agents booking an order for a customer whose cid is c006

SELECT city
	FROM agents
	WHERE agents.aid IN (SELECT aid
		FROM orders
		WHERE orders.cid = 'c006');


2) Get the pids of products ordered through any agent who takes at least one  order from
-- a customer in Kyoto, sorted pid from highest to lowest

SELECT pid
	FROM orders
	WHERE orders.aid IN (
		SELECT aid
		FROM orders
		WHERE orders.cid IN (
				SELECT cid
				FROM customers
				WHERE city = 'Kyoto'));

3) Get the cids and names of customers who did not place an order through agent a03.

SELECT name, cid
	FROM customers
	WHERE customers.cid in (
		SELECT cid
		FROM orders
		WHERE aid <> 'a03');

4) Get the cids of customers who ordered both product p01 and p07.

SELECT cid
	FROM orders
	WHERE pid = 'p01'
		OR pid = 'p07'

5) Get the pids of products NOT ordered by any customers who placed any order through agent a05.

SELECT pid
	FROM orders
	WHERE orders.cid NOT IN (
		SELECT cid
		FROM orders
		WHERE aid = 'a05');

6) Get the name, discounts, and city for all customers who place orders through agents in Dallas or New York.

SELECT name, discount, city
	FROM customers
	WHERE customers.cid in (
		SELECT cid
		FROM orders
		WHERE orders.aid IN ( 
				SELECT aid
				FROM agents
				WHERE city = 'Dallas'
				OR city = 'New York'));

7) Get all customers who have the same discount as that of any customers in Dallas or London

SELECT name
	FROM customers
	WHERE customers.discount IN (
		SELECT discount
		FROM customers
		WHERE city = 'Dallas'			OR city = 'London')


8) Tell me about check constraints: What are they? What are they good for? What’s the advantage of 
-- putting that sort of thing inside the database? Make up some examples of good uses of check 
-- constraints and some examples of bad uses of check constraints. Explain the differences in 
-- your examples and argue your case.
