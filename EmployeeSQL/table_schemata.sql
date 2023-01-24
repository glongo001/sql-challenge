--drop all tables to create if they alreasy exist
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

--create the titles table
CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	--set the title id as a primary key
	PRIMARY KEY(title_id)
);

--create the departments table
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	--set the department number as a primary key
	PRIMARY KEY(dept_no)
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