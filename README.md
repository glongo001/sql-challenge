# SQL-challenge
As a data engineer at Pewlett Hackard I researched information of employees hired in the 1980s and 1990s. All the information analyzed was obtained from six csv files containing tables with employee information, these were:
- titles: contains the title id and title name of each position in the company.
- departments: contains the department number and department names.
- employees: contains the employee number, employee title id, birth date, first name, last name, sex and hire date of each employee.
- dept_manager: contains the department number and employee number of all department managers.
- dept_emp: contains the employee number and department number of all employees.
- salaries: contains the employee number and salary of all employees.
## Data Modeling
I sketched an Entity Relationship Diagram of the tables with QuickDBD.

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/ERD.png)

## Data Engineering
I created a table schema for each of the 6 csv files, I specified the data types, primary keys, foreign keys and other constraints. Then I imported each csv file into its corresponding SQL table.

- For the titles table I set the title id and title name as variable characters and set the title id as a primary key:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/titles%20table.png)

- For the departments table I set the department number and department name as variable characters and set the department number as a primary key:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/departments%20table.png)

- For the employees table I set the employee number as an integer, the employee title id, first name, last name, and sex as variable characters, and the birth date and hire date as dates. I set the employee number as a primary key and the employee title id as a foreign key that references title id from the titles table:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/employees%20table.png)

- For the dept_manager table I set the department number as a variable character and the employee number as an integer. I set the department number as a foreign key that references department number from the departments table. I also set the employee number as a foreign key that references employee number from the employees table:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/dept_manager%20table.png)

- For the dept_emp table I set the employee number as an integer and the department number as a variable character. I set the employee number as a foreign key that references employee number from the employees table. I also set the department number as a foreign key that references department number from the departments table:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/dept_emp%20table.png)

- For the salaries table I set the employee number and salary as integers. I set the employee number as a foreign key that references employee number from the employees table:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/salaries%20table.png)

## Data Analysis
1. I listed the employee number, last name, first name, sex and salary of all employees:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/query1.png)

2. I listed the first name, last name, and hire date for all employees hired in 1986:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/query2.png)

3. I listed the managers of all departments with their department number, department name, employee number, last name, and first name:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/query3.png)

4. I listed the department number of all employees with their employee number, last name, first name, and department name:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/query4.png)

5. I listed the first name, last name, and sex of all employees with Hercules as their first name and a last name that begins with B:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/query5.png)

6. I listed all the employees in the Sales department with their employee number, last name, and first name:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/query6.png)

7. I listed all employees in the Sales and Development departments with their employee number, last name, first name, and department name:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/query7.png)

8. I listed the frequency counts of all the employee last names from the most frequent last name to the least frequent:

![alt text](https://github.com/glongo001/sql-challenge/blob/main/EmployeeSQL/Images/query8.png)
