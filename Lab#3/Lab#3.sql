Harris Nagle
Lab#3 


SELECT ordno, dollars
from orders;

SELECT name, city
FROM agents
WHERE name = 'Smith';

SELECT pid, name, priceUSD
FROM products
WHERE quantity > 200000

SELECT name, city
FROM customers
WHERE city = 'Dallas';

SELECT name
FROM agents
WHERE city <> 'New York'
OR city <> 'Tokyo';

SELECT pid, name, city, quantity, priceUSD
FROM products
WHERE priceUSD >= 1
AND city <> 'Dallas'
AND city <> 'Duluth';

SELECT ordno, mon, cid, aid, pid, qty, dollars
FROM orders
WHERE mon = 'jan'
OR mon = 'may';

SELECT ordno, mon, cid, aid, pid, qty, dollars
FROM orders
WHERE dollars > 500;

SELECT
FROM customers
WHERE cid = 'c005';