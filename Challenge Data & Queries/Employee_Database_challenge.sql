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

--Distinct Selection
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;
SELECT * FROM unique_titles;

--Retiring titles
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
