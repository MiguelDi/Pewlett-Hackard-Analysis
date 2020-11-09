Commit;
--Delveriable 1
SELECT DISTINCT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS ti 
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;
SELECT * FROM retirement_titles;

--Distinct Selection
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;
SELECT * FROM unique_titles;

--retiring titles
SELECT COUNT(emp_no),title
INTO Retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY 1 DESC;
SELECT * FROM retiring_titles;

--Deliverable 2
SELECT e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibilty
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN titles As ti ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no
SELECT * FROM mentorship_eligibilty;

--Elegible_titles
SELECT COUNT (un.emp_no), un.title
INTO elegible_titles
FROM mentorship_eligibilty AS un
GROUP by un.title
ORDER by un.count DESC
SELECT * FROM elegible_titles;

--Creating mentorship_eligibility by department
SELECT DISTINCT ON (e.emp_no) ti.title,
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	de.dept_no,
	dp.dept_name
INTO department_eligible
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
INNER JOIN departments AS dp
ON (de.dept_no = dp.dept_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no
SELECT * FROM department_eligible;

--Elegible_by_department
SELECT COUNT (de.emp_no), de.dept_name
INTO department_eligible_count
FROM department_eligible AS de
GROUP by de.dept_name
ORDER by de.count DESC;

SELECT * FROM department_eligible_count



