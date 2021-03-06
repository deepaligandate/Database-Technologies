#Assignment - 21

#Grant and Revoke.

use assignment;
#1) Give Amit the right to change the ratings of the customers.
Grant update on customer to Amit ;


#2) Give Manoj the right to give other users the right to query the Orders table.
Grant select on orders to Manoj with grant option;

Grant select on Manoj.orders to Deepali;


#3) Take the INSERT privilege on Salespeople away from Ajita.
Revoke insert on salespeople from Ajita;

#4) Grant Abhijeet the right to insert or update the Customers table while keeping her possible rating values in the range of 100 to 500.

Create OR Update View v100 AS
SELECT *
FROM customer
WHERE rating BETWEEN 100 AND 500 WITH CHECK OPTION;

Grant update on v100 TO Ajita;


#5) Allow Vikram to query the Customers table, but restrict his access to those customers whose rating is the lowest.

Create or update  View rest_min AS
SELECT * FROM customer
WHERE rating NOT IN (SELECT min(rating) FROM customer);

 GRANT
SELECT ON rest_min TO Vikaram;