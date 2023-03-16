CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR NOT NULL
);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY(emp_no, emp_title_id)
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL REFERENCES departments(dept_no),
	emp_title_id VARCHAR NOT NULL,
	FOREIGN KEY (emp_no, emp_title_id) REFERENCES employees(emp_no, emp_title_id),
	PRIMARY KEY(emp_no, dept_no)
);

ALTER TABLE dept_emp DROP COLUMN emp_title_id;

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	FOREIGN KEY (emp_no, emp_title_id) REFERENCES employees(emp_no, emp_title_id),
	PRIMARY KEY(dept_no, emp_no)
);

ALTER TABLE dept_manager DROP COLUMN emp_title_id;

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	FOREIGN KEY (emp_no, emp_title_id) REFERENCES employees(emp_no, emp_title_id),
	salary INT
);
ALTER TABLE salaries DROP COLUMN emp_title_id;

CREATE TABLE titles(
	emp_title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no,emp_title_id) REFERENCES employees(emp_no,emp_title_id),
	PRIMARY KEY (emp_title_id, title)
);
ALTER TABLE titles DROP COLUMN emp_no;
