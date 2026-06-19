use 50_days_sql_challenge;
--1. Find the employess who have valid departments..
select e.emp_id,
    e.emp_name,
    d.dept_name
from clean_employees e
    join clean_departments d on e.dept_id = d.dept_id --2.Find All employess even w/0 department
select e.emp_id,
    e.emp_name,
    d.dept_name
from clean_employees e
    left join clean_departments d on e.dept_id = d.dept_id;
--3.list employess without dept
select e.emp_id,
    e.emp_name,
    d.dept_name
from clean_employees e
    left join clean_departments d on e.dept_id = d.dept_id
where dept_name IS NULL;
-- 4. who earns how much??
SELECT e.emp_id,
    e.emp_name,
    s.salary
FROM clean_employees e
    INNER JOIN clean_salaries s ON e.emp_id = s.emp_id;
--5.list employess without salary or like salry is null
SELECT e.emp_id,
    e.emp_name,
    s.salary
FROM clean_employees e
    INNER JOIN clean_salaries s ON e.emp_id = s.emp_id
WHERE s.salary IS NULL
    OR s.salary = 0;