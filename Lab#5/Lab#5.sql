Harris Nagle
Lab #5
Painful Queries :-)
Alpacas.

1) Show the cities of agents booking an order for a customer with the pid of c006

SELECT city
FROM agents
INNER JOIN orders
ON orders.aid = agents.aid
WHERE cid = 'c006'

2) Show the pids of products ordered through any agent who makes at least one order for 
-- a customer in Kyoto. Sorted by pid highest to lowest.

SELECT distinct ord1.pid
from orders as ord1, orders as ord2, agents, customers
where agents.aid = ord1.aid
and ord2.cid = customers.cid
and agents.aid = ord2.aid
and customers.city = 'Kyoto'
order by pid desc

3) Show the names of customers  who have never placed an order ( Query )

SELECT cid
FROM orders
WHERE orders.cid NOT in (SELECT name
			FROM customers);

4) Show the names of customers who have never placed an order( Joins )

SELECT name
FROM orders
LEFT OUTER JOIN customers AS cus
ON cus.name = cus.name

5) Show the names of customers who placed at least one order through an agent in their
-- own city, along with those agent(s') names

SELECT *
FROM customers
INNER JOIN agents ON agents.city = agents.city


6) Show the names of customers and agents living in the same city, along with the 
-- name of the shared city, regardless of whether or not the customer has ever placed 
-- an order with that agent.

SELECT name, city
FROM agents
WHERE city IN (SELECT city
		FROM customers)

7) Show the name and city of customers who live in the city that makes the fewest 
-- different kinds of products.

SELECT name, city
FROM customers 
WHERE customers.city in( SELECT city
		FROM(SELECT products.city, count(products.pid) AS sum
			FROM products
			GROUP BY products.city
			ORDER BY sum asc
			limit 1)
			as alias);
