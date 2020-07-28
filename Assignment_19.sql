#Assignment – 19
#Views.
#1) Create a view that shows all of the customers who have the highest ratings.
Select * from customers;

create view cust_maxrating 
as select * from customers 
where rating=(select max(rating) from customers);

Select * from cust_maxrating;

#2) Create a view that shows the number of salespeople in each city.
select * from salespeople;

create view salespeople_city 
as select city, count(city) 
from salespeople
group by city;

select * from salespeople_city;

#3) Create a view that shows the average and total orders for each salesperson after his or her name. Assume all names are unique.

select * from orders;
select * from salespeople;

create view avgTotalOrder
as
select sname,avg(onum),count(onum)
from salespeople
join orders using (snum)
group by sname;

select * from avgTotalOrder;

#4) Create a view that shows each salesperson with multiple customers.

select * from salespeople;
select * from customers;

create view salesperson
as
select sname,cname
from salespeople
join customers using (snum);

select * from salesperson;

