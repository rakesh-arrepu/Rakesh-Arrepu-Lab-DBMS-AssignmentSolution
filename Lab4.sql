use `order-directory`;
-- 3) Display the number of the customer group by their genders who have placed any order of amount greater than or equal to Rs.3000
SELECT 
    CUS_GENDER, COUNT(CUS_GENDER)
FROM
    customer c
        JOIN
    orders o ON o.CUS_ID = c.CUS_ID
WHERE
    o.ORD_AMOUNT >= 3000
GROUP BY c.CUS_GENDER;

-- 4) Display all the orders along with the product name ordered by a customer having Customer_Id=2
SELECT 
    O.CUS_ID CUSTOMER_ID,
    O.ORD_DATE ORDER_DATE,
    O.ORD_AMOUNT ORDER_AMOUNT,
    P.PRO_NAME PRODUCT_NAME,
    P.PRO_DESC PRODUCT_DESCRIPTION
FROM
    orders O
        JOIN
    PRODUCT_DETAILS PD ON (O.PROD_ID = PD.PROD_ID)
        JOIN
    PRODUCT P ON (PD.PRO_ID = P.PRO_ID)
WHERE
    O.CUS_ID = 2;

-- 5) Display the Supplier details who can supply more than one product.
SELECT 
    s.SUPP_ID SUPPLIER_ID,
    s.SUPP_NAME SUPPLIER_NAME,
    s.SUPP_CITY SUPPLIER_CITY,
    s.SUPP_PHONE SUPPLIER_PHONE
FROM
    supplier s
        JOIN
    product_details pd ON (s.SUPP_ID = pd.SUPP_ID)
GROUP BY pd.SUPP_ID
HAVING COUNT(pd.SUPP_ID) > 1;

-- 6) Find the category of the product whose order amount is minimum
SELECT 
    *
FROM
    orders o
        JOIN
    product_details pd ON (pd.PROD_ID = o.PROD_ID)
        JOIN
    product p ON (p.PRO_ID = pd.PRO_ID)
        JOIN
    category c ON (c.CAT_ID = p.CAT_ID)
HAVING MIN(o.ORD_AMOUNT);

-- 7) Display the Id and Name of the Product ordered after “2021-10-05”
select p.PRO_ID PRODUCT_ID, p.PRO_NAME PRODUCT_NAME
from orders o
join product_details pd on (pd.PROD_ID = o.PROD_ID)
join product p on (p.PRO_ID = pd.PRO_ID)
where o.ORD_DATE > '2021-10-05';

-- 8) Print the top 3 supplier name and id and their rating on the basis of their rating along with the customer name who has given the rating.
SELECT 
    s.SUPP_ID SUPPLIER_ID,
    s.SUPP_NAME SUPPLIER_NAME,
    r.RAT_RATSTARS
FROM
    supplier s
        JOIN
    rating r ON (r.SUPP_ID = s.SUPP_ID)
        JOIN
    customer c ON (c.CUS_ID = r.CUS_ID)
ORDER BY r.RAT_RATSTARS DESC
LIMIT 3;

-- 9) Display customer name and gender whose names start or end with character 'A'.
SELECT 
    CUS_NAME, CUS_GENDER
FROM
    customer
WHERE
    CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';

-- 10) Display the total order amount of the male customers.
SELECT 
    SUM(o.ORD_AMOUNT)
FROM
    orders o
        JOIN
    customer c ON (c.CUS_ID = o.CUS_ID)
WHERE
    c.CUS_GENDER = 'M';

-- 11) Display all the Customers left outer join with the orders
SELECT 
    *
FROM
    customer c
        LEFT OUTER JOIN
    orders o ON o.CUS_ID = c.CUS_ID;
    
    call rate_suppliers();