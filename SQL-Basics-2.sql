CREATE TABLE EMPLOYEE (
    EMP_ID INT,
    EMP_NAME VARCHAR(100),
    GENDER CHAR(1),
    JOINING_DATE DATE
);

/*
NAME CHAR(100)
FULL NAME VARCHAR(100)

NAME 'ABC' 100 BYTES
FULL NAME 'ABC DEFGH' 9 BYTES
*/





SELECT 
    *
FROM
    empLOYEE;

INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE) VALUES (100, 'KUMAR', 'M', '2020-11-15');
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE) VALUES (101, 'SUNITA', 'F', '2020-11-17');
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE) VALUES (102, 'PAVAN', 'M', '2020-11-10');
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE) VALUES (103, 'NITISH', 'M',  '2020-10-12');
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE) VALUES (104, 'ROHIT', 'M',  '2020-09-21');
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE) VALUES (105, 'VIRAT', 'M',  '2020-07-18');
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE) VALUES (106, 'SITA', 'F',  '2020-08-15');
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE) VALUES (107, 'TANUJA', 'F',  '2020-02-28');

SELECT 
    *
FROM
    employee;

SELECT 
    *
FROM
    employee
WHERE
    emp_id = 104;

SELECT 
    *
FROM
    employee
WHERE
    emp_name = 'SITA';

SELECT 
    *
FROM
    employee
WHERE
    joining_date > '2020-08-15';

SELECT 
    *
FROM
    employee
WHERE
    joining_date >= '2020-08-15';

SELECT 
    *
FROM
    employee
WHERE
    joining_date >= '2020-11-01'
        OR joining_date < '2020-03-01';

SELECT 
    *
FROM
    employee
WHERE
    GENDER != 'M';


select * from employee where joining_date >='2020-10-01' and gender = 'F';

select * from employee where joining_date >='2020-10-01' and gender = 'f';
/*
case insensitive
*/

select * from employee LIMIT 4;

select * from employee where emp_name like 'S%';

select * from employee where emp_name not like 'S%';

select * from employee where emp_name not like '%T';

select * from employee where emp_name not like '%T%';

/*
	= > >= < <= != or and like
*/

select * from employee where joining_date >= '2020-02-28' and joining_date <='2020-09-21';

select * from employee where joining_date between '2020-02-28' and '2020-09-21';







----------------------------------------------------

