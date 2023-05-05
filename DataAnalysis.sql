-- Data Analysis
-- list the employee number, last name, first name, sex and salary of each employee

SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- list the first name, last name, and hire date for the employees who were hired in 1986

SELECT first_name, last_name, hire_date 
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') LIKE '%1986';

-- list the manager of each department along with their dept number, dept name, employee number, last name and first name. 

SELECT departments.dept_no,departments.dept_name, dept_manager.emp_no, last_name, first_name
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no; 

-- list department number for for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT departments.dept_no, dept_emp.emp_no, last_name, first_name, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no; 


-- list first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex 
From employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- list each employee in the Sales department, including their employee number, last name, and first name.
SELECT departments.dept_name, dept_emp.emp_no, last_name, first_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

-- list each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

-- list the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT COUNT(last_name), last_name AS Surname 
From employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
