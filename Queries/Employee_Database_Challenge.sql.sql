--Deliverable 1

select e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date, 
ti.to_date,
e.birth_date
into retirement_titles
FROM employees as e
inner join titles as ti
on (e.emp_no = ti.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no;


SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
where to_date = '9999-01-01'
ORDER BY emp_no, title DESC;


select count(*) as count, title
into retiring_titles
from unique_titles
group by title
order by count(*) desc;


-- Deliverable 2

SELECT DISTINCT ON(e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
into mentorship_eligibilty
from employees as e
inner join dept_emp as de
on (e.emp_no = de.emp_no)
inner join titles as ti
on (e.emp_no = ti.emp_no)
where(e.birth_date between '1965-01-01' and '1965-12-31')
and de.to_date = '9999-01-01'
order by e.emp_no;