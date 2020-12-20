/*
LENGTH
RTRIM/LTRIM
CONCAT
SUBSTR
INSTR
SET functions

COMPOSITE PRIMARY KEY
IMPORT/EXPORT


*/

select length('Hello');
select concat('Mr.',' ','Rakesh');

select * from citizen;



select concat(id,'|',name,'|',gender,'|',age) from citizen;

select length('Hello     '), length(rtrim('Hello     '));
select length(rtrim(ltrim('     Hello     ')));

select * from employee;
update employee set email_id = concat(lower(emp_name),'@yahoo.co.in') where emp_id <= 106;

select email_id, instr(email_id,'gmail.com') from employee;


select substr('hello',2, 3);

select substr('Yellow', 3,2);

select substr('Yellow', 1,2);

select substr(email_id, 1, instr(email_id,'@') -1 ) from employee;

/*
SET FUNCTIONS
A B 

A UNION B 
A INTERSECTION B 
A - B
*/

(SELECT EMP_ID, EMP_NAME FROM EMPLOYEE WHERE AGE < 26)
UNION
(SELECT EMP_ID,EMP_NAME FROM EMPLOYEE WHERE GENDER = 'F');

SELECT * FROM (
SELECT * FROM EMPLOYEE
UNION ALL
SELECT * FROM employee) AS EMPS ORDER BY EMPS.EMP_ID;
