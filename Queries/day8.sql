use 50_days_sql_challenge;


update clean_employees
set emp_name = Trim(emp_name);

--datatypes convertion
--1.Employee table

-- Step 1: change hire_date to TEXT to manipulate values
alter table clean_employees modify hire_date TEXT;

-- Step 2: fix invalid dates (YYYY-MM-DD format rows with impossible dates)
update clean_employees set hire_date = NULL where emp_id = 62;  -- 2018-13-09 (month 13)
update clean_employees set hire_date = NULL where emp_id = 88;  -- 2020-30-02 (Feb 30)
update clean_employees set hire_date = NULL where emp_id = 97;  -- 2021-06-32 (day 32)
update clean_employees set hire_date = NULL where emp_id = 132; -- 2020-30-02 (Feb 30)

-- Step 3: convert all DD-MM-YYYY to YYYY-MM-DD
update clean_employees
set hire_date = STR_TO_DATE(hire_date, '%d-%m-%Y')
where hire_date is not null;

-- Step 4: alter all columns including hire_date as DATE
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
