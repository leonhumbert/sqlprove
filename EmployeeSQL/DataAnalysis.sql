-- DATA ANALYSIS - -
-- SELECT * FROM employees;
-- UPDATE employees
-- SET birth_date = birth_date - 100 year

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
--JOIN employees table with salaries table on emp_no
-- Self: create a table and export it as a CSV 
-- CREATE TABLE employee_info AS
SELECT 
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    employees.sex,
    salaries.salaries
FROM employees 
    JOIN salaries on employees.emp_no = salaries.emp_no;
-- SELECT * FROM employee_info

--2. List employees who were hired in 1986.  
-- Self: create a table and export it as CSV
--CREATE TABLE emp_hire_date AS
SELECT
    employees.first_name,
    employees.last_name,
    employees.hire_date
FROM employees 
WHERE employees.hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY employees.hire_date asc;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- Join departments table with department managers table 
-- Self: create table and expor it as CSV 
-- CREATE TABLE dept_manager_info AS
-- select * from dept_manager;
SELECT 
    departments.dept_no,
    departments.dept_name,
    dept_manager.emp_no,
	employees.first_name,
	employees.last_name
from departments
    INNER JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
	INNER JOIN employees ON employees.emp_no = dept_manager.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.  
-- Join departments table with department employees table 
-- Self: Create table and export it as csv 
--CREATE TABLE emp_by_dept AS 
SELECT
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from employees 
    JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
    JOIN departments ON departments.dept_no = dept_emp.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B." 
-- Self: Create table and export it as csv.
--CREATE TABLE HeruclesB_employees AS  
Select
    employees.first_name,
    employees.last_name
from employees 
WHERE
employees.first_name = 'Hercules' AND employees.last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.  
-- Join departments table and department employees table 
-- Self: create table and export it as csv
-- CREATE TABLE sales_dept AS 
SELECT
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    dept_emp.dept_no,
	departments.dept_name
FROM employees
    JOIN dept_emp on dept_emp.emp_no = employees.emp_no
    JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE
	departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name.  
-- Join departments table with department employees table 
-- CREATE TABLE dev_sales_dept AS 
SELECT
    employees.emp_no,
    employees.last_name,
    employees.first_name,
	dept_emp.dept_no,
    departments.dept_name
FROM employees 
    JOIN dept_emp on dept_emp.emp_no = employees.emp_no
    JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE
	departments.dept_name IN ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name. 
-- Use Employee table 
-- CREATE TABLE emp_lastname AS 
SELECT
    employees.last_name, COUNT(employees.last_name) AS Last_Name_Count
FROM employees 
GROUP BY 
employees.last_name
ORDER BY 
Last_Name_Count DESC; 
