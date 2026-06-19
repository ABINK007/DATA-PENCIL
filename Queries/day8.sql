use 50_days_sql_challenge;


update clean_employees
set emp_name = Trim(emp_name);

--datatypes convertion
--1.Employee table
alter table clean_employees
modify emp_id int,
modify emp_name varchar(100),
modify age int,
modify city varchar(50),
modify dept_id int,
modify hire_date date;

DESCRIBE clean_employees;

select * from clean_employees;


--2.department table

alter TABLE clean_departments
modify dept_id int,
modify dept_name varchar(100);

DESCRIBE clean_departments;

--3.attendence table
alter TABLE clean_attendence
modify emp_id int,
modify attendance_id int,
modify attendance_date date;

--4.performance table
alter TABLE clean_performance
modify emp_id int,
modify ratting_2022 int,
modify rating_2023 int,
modify rating_2024 int;

--5.salaries table
alter TABLE clean_salaries
modify salary_id int,
modify emp_id int,
modify salary int,
modify salary_date date;


DESCRIBE clean_departments;
DESCRIBE clean_attendence;
DESCRIBE clean_performance;
DESCRIBE clean_salaries;
