Harris Nagle
Lab #6
Really Really Awful Queries
ALPACAS


1) Display the name and city of customers who live in any city that makes 
-- the most different kinds of products. (There are two cities that make the most different products. 
-- Return the name and city of customers from either one of those.)

SELECT name, city
	FROM customers 
	WHERE customers.city IN( SELECT city
		FROM(SELECT products.city, COUNT(products.pid) AS sum
			FROM products
			GROUP BY products.city
			ORDER BUY sum dESC
			limit 1)				AS alias);

2) Display the names of products whose priceUSD is below the average priceUSD, in alphabetical order.

SELECT name
	FROM products
	WHERE priceUSD < (SELECT AVG(priceUSD)
		FROM products)
		ORDER BY name ASC;


3) Display the customer name, pid ordered, and the dollars for all orders, sorted by dollars from high to low.

SELECT dollars, name, pid
	FROM orders, customers
	WHERE orders.cid = customers.cid
	ORDER BY dollars DESC


4) Display all customer names (in reverse alphabetical order) and their total ordered, 
-- and nothing more. Use coalesce to avoid showing NULLs.

SELECT name, sum(qty)
	FROM customers, orders
	WHERE customers.cid = orders.cid
		GROUP BY name 
		ORDER BY name ASC

5) Display the names of all customers who bought products from agents based in Tokyo along 
-- with the names of the products they ordered, and the names of the agents who sold it to them

SELECT customers.name, products.name, agents.name
	FROM customers, products, orders, agents
	WHERE customers.cid = orders. cid
		AND products.pid = orders.pid
		AND agents.city = 'Tokyo'


6) Write a query to check the accuracy of the dollars column in the Orders table. This means 
-- calculating Orders.dollars from data in other tables and comparing those values to the values in Orders.dollars. Display all rows in Orders where Orders.dollars is incorrect, if any.

SELECT qty * priceUSD * (discount *.1), dollars, ordno
	FROM orders, products, customers
	WHERE orders.pid = products.pid
		AND orders.cid = customers.cid
		ORDER BY ordno ASC


7) What’s the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example queries 
--in SQL to demonstrate. (Feel free to use the CAP2 database t make your points here.)

--The differnces between a left join and a right outer join are simple. We will use A and B as an example.
-- When we use a left outer join between the values of A and B it will take everything in A and 
-- any common values in B. A right outer join will take everything in B and then any common 
-- values in A.
