/*

HIERARCHY QUERIES

*/


CREATE TABLE FAMILY 
(
	MEMBER_ID INT PRIMARY KEY,
	MEMBER_NAME VARCHAR(100),
	PARENT_MEMBER_ID INT,
	CONSTRAINT PARENT_MEMBER_FK FOREIGN KEY (PARENT_MEMBER_ID)
	REFERENCES FAMILY (MEMBER_ID)
);


INSERT INTO FAMILY VALUES (101,'HUSSAIN',NULL);
INSERT INTO FAMILY VALUES (102,'KANEEZ',101);
INSERT INTO FAMILY VALUES (103,'RAJA',102);
INSERT INTO FAMILY VALUES (104,'ZAIN',103);
INSERT INTO FAMILY VALUES (105,'CHAN',102);
INSERT INTO FAMILY VALUES (106,'PYAR',102);
INSERT INTO FAMILY VALUES (107,'HASAN',101);
INSERT INTO FAMILY VALUES (108,'MUNNY',107);
INSERT INTO FAMILY VALUES (109,'RAJA',107);
INSERT INTO FAMILY VALUES (110,'HEERA',101);
INSERT INTO FAMILY VALUES (111,'SONY',110);
INSERT INTO FAMILY VALUES (112,'RASHED',110);
INSERT INTO FAMILY VALUES (113,'SHERA',101);
INSERT INTO FAMILY VALUES (114,'GULSHAN',113);
INSERT INTO FAMILY VALUES (115,'SANJU',114);
INSERT INTO FAMILY VALUES (116,'ROUSHAN',113);


SELECT * FROM FAMILY where parent_member_id = 101;


SELECT MEMBER_NAME FROM FAMILY WHERE PARENT_MEMBER_ID =
(SELECT MEMBER_ID FROM FAMILY WHERE MEMBER_NAME = 'SHERA');



WITH RECURSIVE FAMILY_MEMBERS (ID, NAME, PATH, LEVEL, PARENT) AS
(
	SELECT MEMBER_ID, MEMBER_NAME, MEMBER_NAME, 1, PARENT_MEMBER_ID
    FROM FAMILY WHERE PARENT_MEMBER_ID IS NULL
    UNION ALL
	SELECT F.MEMBER_ID, F.MEMBER_NAME, CONCAT(FM.PATH, ' - ', F.MEMBER_NAME), FM.LEVEL + 1, F.PARENT_MEMBER_ID
    FROM FAMILY_MEMBERS FM JOIN FAMILY F ON FM.ID = F.PARENT_MEMBER_ID
)
SELECT CONCAT(REPEAT('     ',LEVEL),NAME) FROM FAMILY_MEMBERS;


