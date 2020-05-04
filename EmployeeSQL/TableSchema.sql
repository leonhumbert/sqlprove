--Table Squema:
-- Tasks: 1. Create Table, 
--		  2. then refresh tables, 
--		  3. import CSV, 
--		  4. and view table populated

-- Create 6 tables: 1) departments,
-- 2) titles, 3)employees, 4)department managers, 
-- 5)department employees, 6) salaries

-- 1. Create a departments table

CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
--Import CSV
--See Table
SELECT * FROM departments;

-- 2. Create Titles table
CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);
--Import CSV
--See table
SELECT * FROM titles;

-- 3. Create an employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
    first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR (10) ,
	hire_date DATE NOT NULL
);
ALTER TABLE employees
ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);
--Import CSV
--See table 
SELECT * FROM employees

-- 4. Create a department managers table
CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)	
);
ALTER TABLE dept_manager
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

--Import CSV
--See Table
SELECT * FROM dept_manager;

-- 5. Create a department employees table
CREATE TABLE dept_emp (
    emp_no INT,
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
--Import CSV
--See table
SELECT * FROM dept_emp;

-- 6. Create a salaries table
CREATE TABLE salaries (
    emp_no INT,
	salaries INT,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
--Import CSV
--See table
SELECT * FROM salaries;
