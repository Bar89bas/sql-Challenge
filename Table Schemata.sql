SELECT * FROM salaries 

-- creating titles schema 
CREATE TABLE titles (
    title_id VARCHAR (50)NOT NULL,
    title VARCHAR(100) NOT NULL,
    PRIMARY KEY (title_id)
);

-- creating employees schema 
CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR (50) NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR (100) NOT NULL,
    last_name VARCHAR (100)  NOT NULL,
    sex VARCHAR (50)NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY (emp_no)
);

-- creating departments schema 
CREATE TABLE departments (
    dept_no VARCHAR (50) NOT NULL,
    dept_name VARCHAR (100)  NOT NULL,
    PRIMARY KEY (dept_no)
);

-- creating dept_emp schema

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- creating dept-manager schema 
CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);

-- creating salaries schema
CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);


