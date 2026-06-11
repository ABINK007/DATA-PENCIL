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