DROP TABLE employees;

DROP TABLE departments;

DROP TABLE roles;

DROP TABLE salaries;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE employees
(
emp_id BIGSERIAL CONSTRAINT emp_id_key PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
gender VARCHAR(50) NOT NULL,
address VARCHAR(50) UNIQUE NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
dept_id BIGINT REFERENCES departments (dept_id) ON DELETE CASCADE,
role_id BIGINT REFERENCES roles(role_id) ON DELETE CASCADE,
salary_id BIGINT REFERENCES salaries(salary_id) ON DELETE CASCADE,
overtime_id BIGINT REFERENCES overtime(overtime_id) ON DELETE CASCADE


);

INSERT INTO employees 
(first_name,
 surname,
 gender,
 address,
 email,
 dept_id,
 role_id,
 salary_id,
 overtime_id

)
 VALUES
 ('Nana', 'Pans','female','2135 Schoeman St','nana@gmail.com',4,3,4,NULL),
 ('Fade','Walker','male','740 Willow St','fade@gmail.com',3,NULL,3,4),
 ('Habibian','Shongwe','female','2423 Amos St','hs@gmail.com',1,1,NULL,2),
 ('Sizwe','Nchabe','male','1759 Morgan Rd','sizswe@gmail.com',NULL,4,2,3)

 SELECT*FROM employees;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE departments
(
dept_id BIGSERIAL CONSTRAINT dept_id_key PRIMARY KEY,
dept_name VARCHAR (50) NOT NULL,
dept_city VARCHAR(50) NOT NULL
);


INSERT INTO departments
(
dept_name,
dept_city
)
VALUES
('IT','Cape Town'),
('Finance','Pretoria'),
('Marketing','Johannesburg'),
('HR','Polokwane')


SELECT*FROM departments;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE roles
(
role_id BIGSERIAL CONSTRAINT role_id_key PRIMARY KEY,
roles VARCHAR(50) NOT NULL
);

INSERT INTO roles
(
roles
)
VALUES
('Software engineer '),
('Sales manager'),
('Workplace safety'),
('Finance analyst')



SELECT*FROM roles;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE salaries
(
	salary_id BIGSERIAL CONSTRAINT salary_id_key PRIMARY KEY,
	salary_pa money NOT NULL
);

INSERT INTO salaries
(
salary_pa
)
VALUES
(540001),
(387928),
(313799),
(540000)


SELECT*FROM salaries;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE overtime
(
overtime_id BIGSERIAL CONSTRAINT overetime_id_key PRIMARY KEY,
overtime_hour SMALLINT
);


INSERT INTO overtime 
(
overtime_hour
)
VALUES
(2),
(5),
(8),
(10)


SELECT*FROM overtime;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT
   departments.dept_name dept_name,
   roles.roles job_title,
   salaries.salary_pa salary_figure,
   overtime.overtime_hour overtime_hours_worked
FROM employees
LEFT JOIN salaries ON salaries.salary_id = employees.salary_id
LEFT JOIN departments ON departments.dept_id = employees.dept_id 
LEFT JOIN roles ON roles.role_id = employees.role_id
LEFT JOIN overtime ON overtime.overtime_id = employees.overtime_id;