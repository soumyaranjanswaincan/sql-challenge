COPY titles FROM 'C:\Soumya\Data Analytics\Module 9 - Challenge\Challenge files\Starter_Code\data\titles.csv' WITH (FORMAT csv, HEADER true);
COPY departments FROM 'C:\Soumya\Data Analytics\Module 9 - Challenge\Challenge files\Starter_Code\data\departments.csv' WITH (FORMAT csv, HEADER true);

SELECT * from departments;

CREATE TEMP TABLE Temp_Employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR,
  birth_date VARCHAR,
  first_name VARCHAR,
  last_name VARCHAR,
  sex VARCHAR,
  hire_date VARCHAR
	);
	
COPY Temp_Employees FROM 'C:\Soumya\Data Analytics\Module 9 - Challenge\Challenge files\Starter_Code\data\employees.csv' WITH (FORMAT csv, HEADER true);

SELECT * FROM Temp_Employees LIMIT 1;

INSERT INTO employees (emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date)
SELECT emp_no,emp_title_id,TO_DATE(birth_date, 'MM/DD/YYYY'),first_name,last_name,sex,TO_DATE(hire_date, 'MM/DD/YYYY') FROM Temp_Employees;

SELECT * FROM employees LIMIT 1;

DROP TABLE Temp_Employees;

COPY dept_manager FROM 'C:\Soumya\Data Analytics\Module 9 - Challenge\Challenge files\Starter_Code\data\dept_manager.csv' WITH (FORMAT csv, HEADER true);
COPY salaries FROM 'C:\Soumya\Data Analytics\Module 9 - Challenge\Challenge files\Starter_Code\data\salaries.csv' WITH (FORMAT csv, HEADER true);
COPY dept_emp FROM 'C:\Soumya\Data Analytics\Module 9 - Challenge\Challenge files\Starter_Code\data\dept_emp.csv' WITH (FORMAT csv, HEADER true);


