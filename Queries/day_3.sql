USE 50_days_sql_challenge;
--Employee Table
--1 write query for repalce null values in the table employee with the string 'unkown' where employee name is null in cleaned employee table
update clean_employees
set emp_name = 'unknown'
where emp_name is null
    or emp_name = '';
select *
from clean_employees;
--1.b write query to update the emp_city to 'Delhi' for the employee where emp_id is known (if it is null) like  emp_id = 13 in the cleaned employee table
update clean_employees
set city = 'Delhi'
where emp_id = 13;
--1.c write query to update the emp_city to 'Delhincr' for the employee where emp_id is null or  emp_id is ''..
update clean_employees
set city = 'Delhincr'
where city is null
    or city = '';
--Performance Table
--2 Replace Rating of 2023 with 0 only.. biz there is no null values in rating 2022 and rating 2024..
-- select * from clean_performance
-- where
-- rating_2023 is NULL or rating_2023 = ''
update clean_performance
set rating_2023 = 0
where rating_2023 is null
    or rating_2023 = '';
select *
from clean_performance --Tables like attendence ,departments and salaries have no null values so we will not update those tables.

--Find Duplicate Records
--3 write query to find duplicate records in the employee table based on emp_name and emp_city
select emp_name,city,emp_id,count(*)
from clean_employees
group by emp_name,city,emp_id
having count(*)>1;

--4 write query to find duplicate records in the attendence table based on attendance_id,emp_id and attendance_date
select attendance_id,emp_id,attendance_date,count(*)
from clean_attendence
group by attendance_id,emp_id,attendance_date
having count(*)>1;

--5 write query to find duplicate records in the performance table based on emp_id and rating_years
select emp_id,ratting_2022,rating_2023,rating_2024,count(*)
from clean_performance
group by emp_id,ratting_2022,rating_2023,rating_2024
having count(*)>1;

--6 write query to find duplicate records in the salaries table based on salary_id,emp_id and salary_date
select salary_id,emp_id,salary_date,count(*)
from clean_salaries
group by salary_id,emp_id,salary_date
having count(*)>1;

--7 write query to find duplicate records in the departments table based on department_id and department_name
select dept_id,dept_name,count(*)
from clean_departments
group by dept_id,dept_name
having count(*)>1;