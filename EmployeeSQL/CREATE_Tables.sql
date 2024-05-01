CREATE TABLE Titles (
  title_id VARCHAR(5) PRIMARY KEY,
  title VARCHAR(30) NOT NULL
);

CREATE TABLE Departments (
  dept_no VARCHAR(4) PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE Employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR(5) NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date DATE NOT NULL,
  FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Dept_Manager (
  dept_no VARCHAR(4) NOT NULL,
  emp_no INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE Dept_Emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(4) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);