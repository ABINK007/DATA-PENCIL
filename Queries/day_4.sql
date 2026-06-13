use 50_days_sql_challenge;

--1 How to handle duplicates records in the table in sql..

/*Like we have employee with salary having duplicate issue like
we have 
emp_id  emp_name  dept_name salary
101       Ainash      Dataanalyst        50000  
101       Ainash      Dataanalyst        50000
then we give raw number to each record like
emp_id  emp_name  dept_name salary   raw_number 
101       Abinash      Dataanalyst        50000    r_n=1
101       Abinash      Dataanalyst        50000    r_n=2
then we will delete the record where raw_number is greater than 1 
*/

/*This can be done by cte in sql..and we have 3 tables with duplicate records in our database which are employee table ,
 salaries table and performance table.*/


--Remove duplicates from employee table
with cte as (
select *, row_number() over(partition by emp_id,emp_name,city

order by emp_id) as rn

from clean_employees)

delete from clean_employees

where emp_id in
(select emp_id from cte where rn > 1);


--Remove duplicates from salaries table
with cte as (select *, row_number() over
(partition by salary_id,emp_id
order by salary_id) as rn

from clean_salaries)

delete from clean_salaries

where salary_id in
(select salary_id from cte where rn > 1);

--performance table
with cte as 
(select *,row_number() over (partition by emp_id,ratting_2022,rating_2023,rating_2024

order by emp_id) as rn

from clean_performance)

delete from clean_performance

where emp_id in
(select emp_id from cte where rn > 1);


--task 2 find text inconsistencies in city name..

select DISTINCT city FROM clean_employees;

select distinct dept_name from clean_departments;
--No inconsistencies in dept_name.

-- Here we convert city names to proper case to remove inconsistencies in city names.
update clean_employees
set city = concat(upper(left(trim(city),1)),
lower(substring(trim(city),2)))

--Here we can use where clause to update only those records which have inconsistencies in city names like
--where city in ('new york','NEW YORK','new york ')

update clean_employees
set city = case

when city in ('Dlhi','Delhi Ncr','New delhi') then 'DELHI'

when city in ('Hydbd','Hydrabad') then 'HYDERABAD'

when city in ('Bangalore') then 'BENGALURU'

else city
end;
