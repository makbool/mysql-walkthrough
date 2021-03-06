/*
CATEGORY

PRODUCT

SELLER

INVENTORY

*/

CREATE TABLE CATEGORY
(
CATEGORY_ID VARCHAR (20) PRIMARY KEY,
CATEGORY_NAME VARCHAR(100)
);

INSERT INTO CATEGORY VALUES ('CLOT', 'CLOTHING');
INSERT INTO CATEGORY VALUES ('GROC', 'GROCERY');
INSERT INTO CATEGORY VALUES ('ELEC', 'ELECTRONICS');
 
CREATE TABLE PRODUCTS
(
	PRODUCT_ID VARCHAR (20) PRIMARY KEY,
	PRODUCT_NAME VARCHAR(50),
	CATEGORY_ID VARCHAR (20),
    CONSTRAINT PRODUCT_CATEGORY_FK FOREIGN KEY (CATEGORY_ID)
    REFERENCES CATEGORY(CATEGORY_ID)
);

INSERT INTO PRODUCTS VALUES (1, 'IPHONE 10', 'ELEC');
INSERT INTO PRODUCTS VALUES (2, 'FREEDOM OIL 5L', 'GROC');
INSERT INTO PRODUCTS VALUES (3, 'U.S. POLO WOMEN BLACK JEANS', 'CLOT');

CREATE TABLE SELLER
(
	SELLER_ID INT PRIMARY KEY,
	SELLER_NAME VARCHAR(50)
);

INSERT INTO SELLER VALUES (1, 'JAR');
INSERT INTO SELLER VALUES (2, 'HAMA');
INSERT INTO SELLER VALUES (3, 'HULK');

    
CREATE TABLE INVENTORY
(
	SELLER_ID INT,
    PRODUCT_ID INT,
    ITEMS_COUNT INT
);

INSERT INTO INVENTORY VALUES (1, 1, 10);
INSERT INTO INVENTORY VALUES (1, 2, 5);
INSERT INTO INVENTORY VALUES (2, 2, 12);
INSERT INTO INVENTORY VALUES (2, 3, 4);

 
CREATE TABLE PRODUCT_PRICE
(
	PRODUCT_ID INT,
    SELLER_ID INT,
    PRICE INT
);
	
INSERT INTO PRODUCT_PRICE VALUES (1, 1, 85000);
INSERT INTO PRODUCT_PRICE VALUES (2, 1, 650);
INSERT INTO PRODUCT_PRICE VALUES (2, 2, 625);
INSERT INTO PRODUCT_PRICE VALUES (3, 2, 1200);



SELECT * FROM CATEGORY;
SELECT * FROM PRODUCTS;
SELECT * FROM SELLER;
SELECT * FROM PRODUCT_PRICE;
SELECT * FROM INVENTORY;

SELECT C.CATEGORY_NAME,P.PRODUCT_NAME, S.SELLER_NAME, PP.PRICE,  I.ITEMS_COUNT
FROM PRODUCTS P JOIN CATEGORY C ON P.CATEGORY_ID = C.CATEGORY_ID
JOIN PRODUCT_PRICE PP ON P.PRODUCT_ID = PP.PRODUCT_ID RIGHT JOIN SELLER S ON PP.SELLER_ID = S.SELLER_ID
LEFT JOIN INVENTORY I ON I.PRODUCT_ID = P.PRODUCT_ID AND I.SELLER_ID = S.SELLER_ID

WHERE S.SELLER_NAME = 'JAR';




/*
SELF JOIN
*/


CREATE TABLE ELEC_DEPT
(
	DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(20),
	PARENT_DEPT_ID INT,
    CONSTRAINT PARENT_DEPT_FK FOREIGN KEY(PARENT_DEPT_ID)
    REFERENCES ELEC_DEPT(DEPT_ID)
);

INSERT INTO ELEC_DEPT VALUES (101, 'AP', NULL);
INSERT INTO ELEC_DEPT VALUES (102, 'EG', 101);
INSERT INTO ELEC_DEPT VALUES (103, 'WG', 101);
INSERT INTO ELEC_DEPT VALUES (104, 'VSP', 101);

SELECT ED1.DEPT_NAME, ED2.DEPT_NAME AS "PARENT_DEPT_NAME" 
FROM ELEC_DEPT ED1 LEFT JOIN ELEC_DEPT ED2 ON ED1.PARENT_DEPT_ID = ED2.DEPT_ID;

