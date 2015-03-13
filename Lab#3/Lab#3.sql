Harris Nagle
Lab#3 
ALPACAS

1) List the ordno and dollars of all orders.

SELECT ordno, dollars
	FROM orders;

2) List the name and city of agents named Smith

SELECT name, city
	FROM agents
	WHERE name = 'Smith';

3) List the pid, name, and priceUSD of products with quantity more than 200,000

SELECT pid, name, priceUSD
	FROM products
	WHERE quantity > 200000

4) List the names and cities of customers in Dallas

SELECT name, city
	FROM customers
	WHERE city = 'Dallas';

5) List the names of agents not in New york and not in TOkyo.

SELECT name
	FROM agents
	WHERE city <> 'New York'
	OR city <> 'Tokyo';

6) List all data for products not in Dallas or Duluth that cost Us $1 or more

SELECT pid, name, city, quantity, priceUSD
	FROM products
	WHERE priceUSD >= 1
		AND city <> 'Dallas'
		AND city <> 'Duluth';

7) List all data for orders in January or May

SELECT ordno, mon, cid, aid, pid, qty, dollars
	FROM orders
	WHERE mon = 'jan'
		OR mon = 'may';

8) List all data for orders in February more than US $500

SELECT ordno, mon, cid, aid, pid, qty, dollars
	FROM orders
	WHERE dollars > 500;

9) List all orders from the customer whose cid is c005.

SELECT
	FROM customers
	WHERE cid = 'c005';