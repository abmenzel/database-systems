-- a
select count(*)
from employees
where extract(year from birthday) = 1954

-- answer: 23228

-- b
select extract(year from birthday)
from departments D
join dept_manager DM on D.dept_no = DM.dept_no
join employees E on DM.emp_no = E.emp_no
where D.name = 'Finance' and DM.to_date is NULL

-- ans: 1957

-- c
select count(*)
from (
	select dept_no
	from dept_emp
	where to_date is null
	group by dept_no
	having count(emp_no) > 50000
) as large_deps

-- ans: 2

-- d
select emp_no
from (
	select emp_no, SUM(to_date::date - from_date::date)
	from dept_emp
	where to_date is not null
	group by emp_no
	order by sum DESC
) as combined_days
limit 1
-- ans: 30023


-- e
select count (distinct DE.emp_no)
from departments D
join dept_emp DE on D.dept_no = DE.dept_no
join titles T on DE.emp_no = T.emp_no
where D.name = 'Production' and T.title not like '%Engineer'

-- f
select count (*)
from (
select distinct T.title
from departments D
join dept_emp DE on DE.dept_no = D.dept_no
join titles T on DE.emp_no = T.emp_no
where D.name = 'Development' and DE.to_date is null
) X

-- ans: 7

-- g
select count (*)
from (
	select emp_no
	from titles
	where title like '%Engineer'
	group by emp_no
	having count(emp_no) = (select count (distinct title)
	from titles
	where title like '%Engineer')	
) X
-- ans: 3008


-- h
DROP VIEW IF EXISTS min_max_salary;
CREATE VIEW min_max_salary AS
select MAX(S.salary) as salsal
from titles T
join dept_emp DE on DE.emp_no = T.emp_no
join departments D on D.dept_no = DE.dept_no
join salaries S on S.emp_no = DE.emp_no
where T.title = 'Senior Engineer' and D.name = 'Development' and S.to_date is null;

select T.emp_no
from titles T
join dept_emp DE on DE.emp_no = T.emp_no
join departments D on D.dept_no = DE.dept_no
join salaries S on S.emp_no = DE.emp_no
where T.title = 'Senior Engineer' and D.name = 'Development' and DE.to_date is null and S.salary = (select salsal from min_max_salary)

-- ans: 86631




