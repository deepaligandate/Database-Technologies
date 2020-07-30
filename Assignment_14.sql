#Assignment – 14
#Entering, Deleting, and Changing Field Values.

use assignment;

#1) Write a command that puts the following values, in their given order, into the salespeople table: city – San Jose, name – Blanco, 
#comm – NULL, cnum – 1100.
INSERT INTO salespeople (city,sname,comm,snum)
VALUES('San Jose','Blanco',NULL,1100);

#2) Write a command that removes all orders from customer Clemens from the Orders table.
SELECT * FROM orders;

DELETE FROM orders
WHERE cnum IN(SELECT cnum
FROM customers
WHERE cname='Clemens');
     
SELECT *FROM orders;

#3) Write a command that increases the rating of all customers in Rome by 100.

SELECT *FROM customers;

UPDATE customers 
SET Rating = Rating + 100 
WHERE City = 'Rome';

SELECT *FROM Customers;

#4) Salesperson Serres has left the company. Assign her customers to Motika

UPDATE customers
SET snum=(SELECT snum
FROM salespeople
WHERE sname='serres')
WHERE snum =(SELECT snum
FROM salespeople WHERE sname='Motika');
