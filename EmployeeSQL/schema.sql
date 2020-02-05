--employee table
CREATE TABLE employees (
  emp_no INTEGER NOT NULL PRIMARY KEY,
  birth_date VARCHAR NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  gender VARCHAR NOT NULL,
  hire_date VARCHAR NOT NULL
);

--salary table
CREATE TABLE salaries (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  salary INTEGER NOT NULL,
  from_date VARCHAR NOT NULL,
  to_date VARCHAR NOT NULL,
  PRIMARY KEY (emp_no)
);

--titles table
CREATE TABLE titles (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  title VARCHAR NOT NULL,
  from_date VARCHAR NOT NULL,
  to_date VARCHAR NOT NULL,
  PRIMARY KEY (emp_no,title,from_date)
);

--titles departments
CREATE TABLE departments (
  dept_no VARCHAR NOT NULL PRIMARY KEY,
  dept_name VARCHAR NOT NULL
);

--titles department employees
CREATE TABLE dep_emp (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  from_date VARCHAR NOT NULL,
  to_date VARCHAR NOT NULL,
  PRIMARY KEY (emp_no,dept_no)
);

--titles department managers
CREATE TABLE dep_manager (
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  from_date VARCHAR NOT NULL,
  to_date VARCHAR NOT NULL,
  PRIMARY KEY (dept_no,emp_no)
);