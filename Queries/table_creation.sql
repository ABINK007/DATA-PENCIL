use 50_days_sql_challenge;
create table departments (dept_id VARCHAR(40), dept_name VARCHAR(40));
create table employees (
    emp_id VARCHAR(40),
    emp_name varchar(40),
    age varchar(5),
    city varchar(40),
    dept_id varchar(40),
    hire_date varchar(40)
);
create table salaries(
    salary_id varchar(20),
    emp_id varchar(20),
    salary varchar(20),
    status varchar(20)
);
create table attendence (
    attendance_id varchar(20),
    emp_id varchar(20),
    attendance_date varchar(20),
    status varchar(20)
);
create table performance (
    emp_id varchar(20),
    ratting_2022 varchar(10),
    rating_2023 varchar(10),
    rating_2024 varchar(10)
);