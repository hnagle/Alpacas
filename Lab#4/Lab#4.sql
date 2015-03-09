Harris Nagle
Lab#4
Double Queries



1)
select city
from agents
where agents.aid in (select aid
		from orders
		where orders.cid = 'c006');


2)
select pid
from orders
where orders.aid in (
		select aid
		from orders
		where orders.cid in (
					select cid
					from customers
					where city = 'Kyoto'));

3)
select name, cid
from customers
where customers.cid in (
		select cid
		from orders
		where aid <> 'a03');

4)
select cid
from orders
where pid = 'p01'
or pid = 'p07'

5)
select pid
from orders
where orders.cid NOT in (
		select cid
		from orders
		where aid = 'a05');

6)
select name, discount, city
from customers
where customers.cid in (
		select cid
		from orders
		where orders.aid in ( 
					select aid
					from agents
					where city = 'Dallas'
					or city = 'New York'));

7)
select name
from customers
where customers.discount in (
			select discount
			from customers
			where city = 'Dallas'
			or city = 'London')


8) Constraints are used in database to describe limitations on what exactly data can be. They are valuable because they help
organize data and make it easier to be analyzed later on. They make it easier later on because they support tables and their data 
with the check constraints. A possible example of a check constraint is as follows.

select * 
	from orders
	where dollars <1000
