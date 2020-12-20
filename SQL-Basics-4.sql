/*
    IN, NOT IN
    SUBQUERIES
	GROUP BY CLAUSE
    DISTINCT
    ALTER
    DROP
    CONSTRAINTS
*/



select max(joining_date) from employee;

select * from employee where joining_date = '2020-11-17';

select * from employee where joining_date = (select max(joining_date) from employee);

select * from employee;

select dept_id from employee where emp_name = 'ROHIT' or emp_name = 'VIRAT';
select dept_id from employee where emp_name in ('ROHIT','VIRAT');

select emp_name, dept_id from employee where dept_id not in 
(select dept_id from employee where emp_name in ('ROHIT','VIRAT'));


select count(*) from employee;
select count(*)  from employee where gender = 'M';


select GENDER from employee group by gender;
select GENDER, count(*) from employee group by gender;

select dept_id, count(dept_id) as "emp_count", max(joining_date) from employee group by dept_id;

select count(*), count(emp_id), count(dept_id), count(PHONE_NUMBER) from employee;
select count(NULL);

select dept_id from employee;
select distinct dept_id from employee;
select count(*), count(distinct dept_id) from employee;

select 1 from employee;
select "abc" from employee;

select count(1) from employee;
select count(distinct 1) from employee;




DESC employee;


ALTER TABLE EMPLOYEE ADD COLUMN LOCATION TEXT;

ALTER TABLE EMPLOYEE MODIFY COLUMN EMP_ID TEXT;

ALTER TABLE EMPLOYEE DROP COLUMN GENDER;

select * from employee;

DROP TABLE EMPLOYEE;


CREATE TABLE EMPLOYEE (
    EMP_ID INT NOT NULL UNIQUE,
    EMP_NAME VARCHAR(100) NOT NULL,
    GENDER VARCHAR(1),
    JOINING_DATE DATE NOT NULL,
    PHONE_NUMBER BIGINT NOT NULL UNIQUE,
    DEPT_ID INT,
    AGE INT,
    EMAIL_ID VARCHAR(100)
);


ALTER TABLE EMPLOYEE ADD CONSTRAINT EIU UNIQUE (EMAIL_ID) ;

ALTER TABLE EMPLOYEE CHANGE EMAIL_ID EMAIL_ID VARCHAR(100) NOT NULL ;

ALTER TABLE EMPLOYEE ADD CONSTRAINT AGE_LIMIT CHECK (AGE between 20 and 70);

DESC employee;

INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE, PHONE_NUMBER, DEPT_ID, AGE, EMAIL_ID) 
VALUES (104, 'ROHIT', 'M',  '2020-09-21', '7655454545', 1001, 28, 'rohit@gmail.com');

INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE, PHONE_NUMBER, DEPT_ID, AGE, EMAIL_ID) 
VALUES (105, 'SANJANA', 'F',  '2020-09-21', '8966554436', 1001, 35, 'sanjana@gmail.com');

INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE, PHONE_NUMBER, DEPT_ID, AGE, EMAIL_ID) 
VALUES (106, 'ROHIT KUMAR', 'M',  '2020-09-21', '8888888888', 1001, 28, 'rohit.k@gmail.com');


select SYSDATE(), NOW(), CURDATE();

ALTER TABLE EMPLOYEE CHANGE JOINING_DATE JOINING_DATE DATE DEFAULT(CURDATE()) ;

INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, PHONE_NUMBER, DEPT_ID, AGE, EMAIL_ID) 
VALUES (108, 'MOHITA J', 'F', '7777777777', 1003, 26, 'mohita.j@gmail.com');

select count(*) from employee;



INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE, PHONE_NUMBER, DEPT_ID, AGE, EMAIL_ID) 
VALUES (110, 'ROHIT KUMAR1', 'M',  '2020-09-21', '8988888888', 1002, 28, 'rohit.k1@gmail.com');


INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE, PHONE_NUMBER, DEPT_ID, AGE, EMAIL_ID) 
VALUES (111, 'ROHIT KUMAR2', 'M',  '2020-09-21', '8888988888', 1002, 28, 'rohit.k2@gmail.com');


INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE, PHONE_NUMBER, DEPT_ID, AGE, EMAIL_ID) 
VALUES (112, 'ROHIT KUMAR3', 'M',  '2020-09-21', '8888888889', 1002, 28, 'rohit.k3@gmail.com');

INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, GENDER, JOINING_DATE, PHONE_NUMBER, DEPT_ID, AGE, EMAIL_ID) 
VALUES (113, 'ROHIT KUMAR4', 'M',  '2020-09-21', '8888898889', 1002, 28, 'rohit.k4@gmail.com');
