use 50_days_sql_challenge;
-- 1. Find the records in clean_departments where dept_name or dept_id is NULL or empty.
select * from clean_departments
where dept_name is NULL or dept_name = ''
or
dept_id is NULL or dept_id =' '


--2. Find the records in clean_employees where emp_name, emp_id, age, city, dept_id or hire_date is NULL or empty.
select * from clean_employees
where 
emp_name is NULL or emp_name = ''
or
emp_id is NULL or emp_id = ''
or 
age is NULL or age = ''
Or
city is Null or city = ''
or
dept_id is NULL or dept_id = ''
or
hire_date is NULL or hire_date = ''

--3. Find the records in clean_attendance where attendence_id,emp_id,attendance_date and status is NULL or empty.
select * from clean_attendence
where
attendance_id is NULL or attendance_id = ''
or
emp_id is NULL or emp_id = ''
or
attendance_date is NULL or attendance_date = ''
or
status is NULL or status = ''

--4. Find the records in clean_performance where emp_id, ratting_2022, rating_2023 and rating_2024 is NULL or empty.
select * from clean_performance
where
emp_id is NULL or emp_id = ''
or
ratting_2022 is NULL or ratting_2022 = ''
or
rating_2023 is NULL or rating_2023 = ''
or
rating_2024 is NULL or rating_2024 = ''

--5. Find the records in clean_salaries where salary_id, emp_id, salary and salary_date is NULL or empty.
select * from clean_salaries
where
salary_id is NULL or salary_id = ''
or
emp_id is NULL or emp_id = ''
or
salary is NULL or salary = ''
or
salary_date is NULL or salary_date = ''
