Harris Nagle
Lab #6


1)
Select name, city
from customers 
where customers.city in( select city
			from(select products.city, count(products.pid) as sum
				from products
				group by products.city
				order by sum dESC
				limit 1)
				as alias);

2)
select name
from products
where priceUSD < (select AVG(priceUSD)
		from products)
order by name ASC


3)
select dollars, name, pid
from orders, customers
where orders.cid = customers.cid
order by dollars DESC


4)
select name, sum(qty) as blahslah
from customers, orders
	where customers.cid = orders.cid
		group by name order by name ASC


5)
select customers.name, products.name, agents.name
	from customers, products, orders, agents
		where customers.cid = orders. cid
			and products.pid = orders.pid
			and agents.city = 'Tokyo'

6)
select qty * priceUSD * (discount *.1), dollars, ordno
	from orders, products, customers
		where orders.pid = products.pid
			and orders.cid = customers.cid
			order by ordno ASC


7)
The difference between a left outer join and a right outer join is that when a left outer 
join is used between A and B, it takes everything in A and then then the common rows in B.
A right outer join would give us everything in B, and then the common rows in A.
