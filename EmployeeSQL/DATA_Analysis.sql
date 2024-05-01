--Data Analysis
--  List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees emp INNER JOIN salaries sal
ON emp.emp_no = sal.emp_no;

--  List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--  List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM employees emp 
INNER JOIN dept_manager deptmgr ON emp.emp_no = deptmgr.emp_no
INNER JOIN departments dept ON dept.dept_no = deptmgr.dept_no;

--  List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees emp 
INNER JOIN dept_emp empdept ON emp.emp_no = empdept.emp_no
INNER JOIN departments dept ON dept.dept_no = empdept.dept_no;

--  List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT last_name, first_name, sex
FROM employees
WHERE first_name ='Hercules' AND last_name like 'B%';

--  List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no, emp.last_name, emp.first_name
FROM employees emp 
INNER JOIN dept_emp empdept ON emp.emp_no = empdept.emp_no
INNER JOIN departments dept ON dept.dept_no = empdept.dept_no
WHERE dept.dept_name = 'Sales';

--  List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees emp 
INNER JOIN dept_emp empdept ON emp.emp_no = empdept.emp_no
INNER JOIN departments dept ON dept.dept_no = empdept.dept_no
WHERE dept.dept_name in ('Sales','Development');

--  List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(last_name) as Count_of_last_name
FROM employees
GROUP BY last_name
ORDER BY Count_of_last_name DESC;