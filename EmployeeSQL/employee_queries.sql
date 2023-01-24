--drop all tables to create if they alreasy exist
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salary CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

--create the departments table
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	--set the department number as a primary key
	PRIMARY KEY(dept_no)
);

--create the titles table
CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	--set the title id as a primary key
	PRIMARY KEY(title_id)
);

--create the employees table
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	--set the employee number as primary key
	PRIMARY KEY(emp_no),
	--set employee title id as foreign key with title id from titles table as reference
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
);

--create the department manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	--set department number as foreign key with department number from departments table as reference
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	--set employee number as foreign key with employee number from employees table as reference
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

--create the department employee table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	--set employee number as foreign key with employee number from employees table as reference
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	--set department number as foreign key with department number from departments table as reference
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

--create the salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	--set employee number as foreign key with employee number from employees table as reference
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

--query tables
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

--display employee number, last name, first name, sex and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries 
ON employees.emp_no = salaries.emp_no;

--list first name, last name, and hire date for hired in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--list managers with department number, department name, employee number, last name, and first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON employees.emp_no = dept_manager.dept_no;

--department number of employees, employee number, last name, first name, department name
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no;

--first name, last name, sex of each employee first name Hercules last name B...
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name LIKE 'Hercules'
WHERE last_name LIKE 'B'

--employees in Sales department, employee number, last name, first name
SELECT departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_emp
ON dept_emp.dept_no = departments.dept_no
FROM dept_emp
JOIN employees
ON employees.emp_no = dept_emp.emp_no
FROM departments
WHERE departments.dept_name LIKE 'Sales'

--employees in Sales and Development departments, employee number, last name, first name, department name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN departments
ON dept_emp.dept_no = departments.dept_no
FROM dept_emp
JOIN employees
ON employees.emp_no = dept_emp.emp_no
FROM departments
WHERE departments.dept_name LIKE 'Sales'
WHERE departments.dept_name LIKE 'Development'

--frequency counts, descending, employee last names

