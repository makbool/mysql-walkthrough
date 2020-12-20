


SELECT 
    LENGTH(PHONE_NUMBER)
FROM
    EMPLOYEE;

SELECT 
    *
FROM
    EMPLOYEE
WHERE
    LENGTH(PHONE_NUMBER) = 11;
DELETE FROM EMPLOYEE 
WHERE
    EMP_ID = 107;


ALTER TABLE EMPLOYEE ADD CONSTRAINT PHONE_NUMBER check (LENGTH(PHONE_NUMBER)=10);


SELECT 
    *
FROM
    EMPLOYEE;
SELECT DISTINCT
    dept_id
FROM
    employee;

SELECT 
    DEPT_ID
FROM
    EMPLOYEE
WHERE
    COUNT(DEPT_ID);
/*
THE DEPARTMENT WHICH HAVE MAXIMUM NUMBER OF EMPLOYEES

*/

SELECT 
    DEPT_ID, EMP_ID
FROM
    EMPLOYEE;

SELECT 
    COUNT(EMP_iD)
FROM
    EMPLOYEE
WHERE
    DEPT_ID = 1001;

SELECT 
    *
FROM
    employee
WHERE
    dept_id = (SELECT 
            dept_id
        FROM
            (SELECT 
                dept_id, COUNT(EMP_ID) AS emp_count
            FROM
                EMPLOYEE
            GROUP BY DEPT_ID) emp_cnt_1
        WHERE
            emp_count = (SELECT 
                    MAX(emp_count)
                FROM
                    (SELECT 
                        dept_id, COUNT(EMP_ID) AS emp_count
                    FROM
                        EMPLOYEE
                    GROUP BY DEPT_ID) emp_cnt));


SELECT 
    DEPT_ID, COUNT(EMP_ID)
FROM
    EMPLOYEE
GROUP BY DEPT_ID HAVING COUNT(EMP_ID) >= 3;


SELECT 
    DEPT_ID, COUNT(EMP_ID)
FROM
    EMPLOYEE
GROUP BY DEPT_ID HAVING COUNT(EMP_ID) >= 3;
