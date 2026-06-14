use 50_days_sql_challenge;
/*In 1st step we need to convert salary data type string to int..
 biz here we need to calculate some mathematical operation..
 */
--for convert string to int
ALTER TABLE clean_salaries
modify salary int;
SELECT min(salary) as min_salary,
    max(salary) as max_salary,
    avg(salary) as avg_salary
FROM clean_salaries
where salary > 0;
/*we should not replace salary as any random value there is also client give some reference for it
 like here min(salry) = 20000 and max_salary =200000
 so we need to create a new coloumn that will show are there in outlier or not
 if outlier is present then we give value as 1 other wise 0*/
alter table clean_salaries
add column outlier int;
select *
from clean_salaries;
--then place 0 and 1 according to codition
update clean_salaries
set outlier = case
        when salary < 20000
        or salary > 200000 then 1
        else 0
    end;
--show the table
select *
from clean_salaries
where outlier = 1;
--replace with reference value
update clean_salaries
set salary = case
        when salary_id = 17 then 65000
        when salary_id = 37 then 97000
        else salary
    end
where;
select *
from clean_salaries