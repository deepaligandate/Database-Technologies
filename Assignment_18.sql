/*
Assignment – 18
Maintaining the Integrity of your Data.  */
use assignment;

/*1) Create a table called Cityorders. This will contain the same onum, amt and snum fields as the Orders table,
 and the same cnum and city fields as the Customers table, so that each customer’s order will be entered into this table
 along with his or her city. Onum will be the primary key of Cityorders. All of the fields in Cityorders will be constrained 
 to match the Customers and Orders tables. Assume the parent keys in these tables already have the proper constraints. */

 create table cityorders 
	select onum,amt,snum,cnum from orders natural join customers;

 alter table cityorders add primary key(onum);

 desc cityorders;
 select * from cityorders;
 desc orders;

/*2) Redefine the Orders table as follows:- add a new column called prev, which will identify, for each order,
 the onum of the previous order for that current customer. Implement this with a foreign key referring to the Orders table itself. 
 The foreign key should refer as well to the cnum of the customer, providing a definite enforced link between the current order and
 the one referenced. */
 alter table customers add primary key(cnum);
 desc customers;

 alter table cityorders add foreign key(cnum) references customers(cnum);
 desc cityorders;

 alter table cityorders add column prev int(4);
 alter table cityorders add foreign key(prev) references orders(onum);