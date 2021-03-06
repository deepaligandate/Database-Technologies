-- Assignment – 17
-- Constraining the Values of your data.
/*1) Create the Orders table so that all onum values as well as all combinations of cnum and snum are different from one another,
 and so that NULL values are excluded from the date field.*/
create table orders1 (
onum int(4),
Amt float(7,2),
Odate date not null,
Cnum int(4) ,
Snum int(4) ,
primary key(onum,snum,cnum)
);
desc orders1;

/*2) Create the Salespeople table so that the default commission is 10% with no NULLS permitted, snum is the primary key, 
and all names fall alphabetically between A and M, inclusive (assume all names will be uppercase).*/

CREATE TABLE salespeople1 
( 
comm int(3) DEFAULT 10,
 snum int(4) PRIMARY KEY,
 sname varchar(10) check(substr(upper(sname),1,1) BETWEEN 'A' AND 'M') 
 );
 desc salespeople1;

/* 3) Create the Orders table, making sure that the onum is greater than the cnum, and the cnum is greater that the snum.
 Allow no NULLS in any of these three fields .*/
  create table orders2
  (
  onum int(4) not null,
  cnum int(4) not null,
  snum int(4) not null,
  check ( (onum>cnum) and (cnum>snum))
  );
  desc orders2;
  insert into orders2 (onum,cnum,snum) values (1,2,3),
											  (3,4,5);
  insert into orders2 (onum,cnum,snum) values (8,10),
											  (11,14);     
  select * from orders2;     