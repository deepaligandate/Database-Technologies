#Assignment – 15
#Using Subqueries with DML Commands.
#1) Assume there is a table called Multicust, with all of the same column definitions as Salespeople. Write a command that inserts all salespeople with more than one customer into this table.

use assignment;

create table multicust
as
select * from salespeople 
where snum in
(select snum from customers
  GROUP BY snum HAVING count(snum)>1);

select * from multicust;

#2) Write a command that deletes all customers with no current orders.

desc customers;
select * from customers;
select * from orders;

insert into customers values(2010,'Ashwini','Loni',500,1000);
delete from customer where cnum=any
(select cnum from orders where cnum not in(
select cnum from customers) );

#3) Write a command that increases by twenty percent the commissions of all salespeople with total orders above Rs. 3,000.

update salespeople set comm=comm*0.20 
where snum in(select snum from orders where amt>3000);

select * from salespeople;