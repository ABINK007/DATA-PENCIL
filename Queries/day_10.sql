use 50_days_sql_challenge;

--1. what are performance rating of each employess

select e.emp_id,e.emp_name,p.ratting_2022,p.rating_2023,p.rating_2024
from clean_employees as e
join clean_performance as p
on e.emp_id = p.emp_id;

--2.which employee donot have salary records..
select e.emp_id,e.emp_name
from clean_employees as e
left join clean_salaries as s
on e.emp_id = s.emp_id
where s.emp_id is null; 

--3.which employee donot have any attendence record..
select e.emp_id,e.emp_name
from clean_employees as e
left join clean_attendence as a
on e.emp_id = a.emp_id
where a.emp_id is null;

--4.what is the emp_name ,dept , salary together..
select  e.emp_id  , e.emp_name,d.dept_name,s.salary
from clean_employees as e
join clean_departments as d
on e.dept_id = d.dept_id
join clean_salaries as s
on e.emp_id = s.emp_id;
