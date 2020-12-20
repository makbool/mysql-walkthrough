/*

IFNULL


*/
DROP TABLE EMP_SALARY;

CREATE TABLE EMP_SALARY
(
	EMP_ID INT PRIMARY KEY,
    SALARY DECIMAL (20, 5),
    SAL_CURR VARCHAR(3) DEFAULT 'INR',
    BONUS DECIMAL (20,5),
    BONUS_CURR VARCHAR(3) DEFAULT 'INR',
    CONSTRAINT EMP_SAL_FK FOREIGN KEY (EMP_ID)
    REFERENCES EMPLOYEE(EMP_ID)
);

SELECT * FROM EMPLOYEE ORDER BY EMP_ID;

INSERT INTO EMP_SALARY (EMP_ID, SALARY, SAL_CURR, BONUS, BONUS_CURR) 
VALUES (104, 120000, 'INR', '48000', 'INR');

INSERT INTO EMP_SALARY (EMP_ID, SALARY, SAL_CURR) 
VALUES (105, 180000, 'INR');

INSERT INTO EMP_SALARY (EMP_ID, SALARY, SAL_CURR, BONUS, BONUS_CURR) 
VALUES (106, 240000, 'INR', '400', 'USD');

INSERT INTO EMP_SALARY (EMP_ID, SALARY, BONUS) 
VALUES (108, 144000,'20000');

INSERT INTO EMP_SALARY (EMP_ID, SALARY, SAL_CURR, BONUS, BONUS_CURR) 
VALUES (110, 156000, 'INR', NULL, NULL);

INSERT INTO EMP_SALARY (EMP_ID, SALARY, SAL_CURR, BONUS, BONUS_CURR) 
VALUES (111, 156000, 'INR', 0, 'INR');

SELECT 100 + IFNULL(NULL,0) + IFNULL(10,0);

SELECT * FROM EMP_SALARY WHERE BONUS IS NULL OR BONUS = 0;

SELECT * FROM EMP_SALARY WHERE IFNULL(BONUS,0) = 0;

SELECT EMP_ID, SALARY + IFNULL(BONUS,0) FROM EMP_SALARY;


