use 50_days_sql_challenge;


--1.Remove month(invalid)>12
--Here SUBSTRING_INDEX(SUBSTRING_INDEX(hire_date,'-',2),'-',-1)  mean like date 15-03-2003 = 15-03 = 03>12 then set value null if we give 2 ..

update clean_employees
set hire_date = null
where
CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(hire_date,'-',2),'-',-1)AS UNSIGNED)>12;

-- STEP 2 DD-MM-YYYY TO YYYY-MM-DD
-- 28-08-2024 = 2024-08-28

UPDATE clean_employees

SET HIRE_DATE = CONCAT
(
    RIGHT(HIRE_DATE,4), '-',
    SUBSTRING(hire_date, 4, 2), '-',
    LEFT(HIRE_DATE, 2)
)

WHERE hire_date LIKE '__-__-____';


-- step 3 remove invalid day

UPDATE clean_employees
SET hire_date = NULL
WHERE CAST(RIGHT(hire_date,2) AS UNSIGNED) > 31;


ALTER TABLE clean_employees
MODIFY hire_date DATE;


SELECT DISTINCT hire_date
FROM clean_employees;

--4.Replace null and empty value with 2024-02-25
UPDATE clean_employees
SET hire_date = '2024-02-25'
WHERE hire_date IS NULL;

SELECT DISTINCT hire_date
FROM clean_employees;

--modify attendence data
UPDATE clean_attendence

SET attendance_date  = CONCAT
(
    RIGHT(attendance_date ,4), '-',
    SUBSTRING(attendance_date , 4, 2), '-',
    LEFT(attendance_date , 2)
)

WHERE attendance_date  LIKE '__-__-____';

ALTER TABLE clean_attendence
MODIFY attendance_date DATE;