/*update public."PRODUCTS" set "UNITS_IN_STOCK" = NULL
where "UNAVAILABLE" = -1;
 

update public."PRODUCTS" set "UNITS_ON_ORDER" = NULL
where "UNITS_ON_ORDER" = 0;


update public."ORDERS" set "EMPLOYEE_NUMBER" = 7
where "EMPLOYEE_NUMBER" = 2;


update public."ORDERS" set "EMPLOYEE_NUMBER" = 3
where "EMPLOYEE_NUMBER" =5;

update public."ORDERS" set "EMPLOYEE_NUMBER" = 1
where "EMPLOYEE_NUMBER" = 8;

update public."PRODUCTS" set "SUPPLIER_NUMBER" = 1 
where "PRODUCT_REF" in ( select "PRODUCT_REF"
from public."PRODUCTS" 
where "CATEGORY_CODE" in (select "CATEGORY_CODE"
                        from public."CATEGORIES" 
                        where upper("CATEGORY_NAME")='BOISSONS'));


ALTER TABLE "ORDERS" ADD CONSTRAINT FK_ORDERS_CUSTOMERS 
FOREIGN KEY ("CUSTOMER_CODE") REFERENCES "CUSTOMERS" ("CUSTOMER_CODE");

ALTER TABLE "ORDERS" ADD CONSTRAINT FK_ORDERS_EMPLOYEES  
FOREIGN KEY ("EMPLOYEE_NUMBER") REFERENCES "EMPLOYEES" ("EMPLOYEE_NUMBER");

ALTER TABLE "ORDER_DETAILS" ADD CONSTRAINT FK_ORDER_DETAILS_ORDERS 
FOREIGN KEY ("ORDER_NUMBER") REFERENCES "ORDERS" ("ORDER_NUMBER");

ALTER TABLE "ORDER_DETAILS" ADD CONSTRAINT FK_ORDER_DETAILS_PRODUCTS   
FOREIGN KEY ("PRODUCT_REF") REFERENCES "PRODUCTS" ("PRODUCT_REF");

ALTER TABLE "EMPLOYEES" ADD CONSTRAINT FK_EMPLOYEES_EMPLOYES 
FOREIGN KEY ("REPORTS_TO") REFERENCES "EMPLOYEES" ("EMPLOYEE_NUMBER");

ALTER TABLE "PRODUCTS" ADD CONSTRAINT FK_PRODUCTS_CATEGORIES 
FOREIGN KEY ("CATEGORY_CODE") REFERENCES "CATEGORIES" ("CATEGORY_CODE");

ALTER TABLE "PRODUCTS" ADD CONSTRAINT FK_PRODUCTS_SUPPLIERS  
FOREIGN KEY ("SUPPLIER_NUMBER") REFERENCES "SUPPLIERS" ("SUPPLIER_NUMBER");*/


--1. Display in descending order of seniority the male employees whose net salary (salary + commission) 
-- is greater than or equal to 8000. The resulting table should include the following columns: 
-- Employee Number, First Name and Last Name (using LPAD or RPAD for formatting), Age, and Seniority.




SELECT 
	"EMPLOYEE_NUMBER", 
	RPAD("FIRST_NAME", 15, ' ') AS f_name, 
	RPAD("LAST_NAME", 15, ' ') AS l_name, 
	DATE_PART('Year', AGE("BIRTH_DATE")) AS Age,
	"SALARY" + "COMMISSION" AS "SALARY",
	"POSITIONS"
FROM public."EMPLOYEES" 
WHERE "SALARY" >= 8000
ORDER BY CASE "POSITIONS"
	WHEN 'Vice President' THEN 1
	WHEN 'Sales Manager' THEN 2
	WHEN 'Sales Assistant' THEN 3
	WHEN 'Sales Representative' THEN 4
END;


--2. Display products that meet the following criteria: (C1) quantity is packaged in bottle(s), (C2) the third character in the product name is 't' or 'T', 
--(C3) supplied by suppliers 1, 2, or 3, (C4) unit price ranges between 70 and 200, and 
--(C5) units ordered are specified (not null). 
--The resulting table should include the following columns: product number, product name, supplier number, units ordered, and unit price.


SELECT 
	quantity, 
	product_name, 
	supplier_number,
	unit_price,
	units_on_order
FROM products
WHERE quantity LIKE '%bottle%'
AND (SUBSTRING(PRODUCT_NAME, 3, 1) ILIKE 't')
AND supplier_number IN (1,2,3)
AND unit_price BETWEEN 70 AND 200
AND units_on_order IS NOT NULL;
3. Display customers who reside in the same region as supplier 1, meaning they share the same country, city, and the last three digits of the postal code. The query should utilize a single subquery. The resulting table should include all columns from the customer table.


WITH supplier_regions AS (
	SELECT 
		supplier_number, 
		country, 
		city, 
		RIGHT(postal_code, 3) AS p_code 
	FROM suppliers 
	WHERE supplier_number = 1
)
SELECT * FROM customers 
WHERE RIGHT(postal_code, 3) = (SELECT p_code FROM supplier_regions)
AND city = (SELECT city FROM supplier_regions)
AND country = (SELECT country FROM supplier_regions);








