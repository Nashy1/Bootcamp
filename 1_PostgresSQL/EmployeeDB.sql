CREATE TABLE employees
(
emp_id BIGSERIAL CONSTRAINT emp_id_key PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
gender VARCHAR(50) NOT NULL,
address VARCHAR(50) UNIQUE NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
dept_id BIGINT REFERENCES departments (dept_id),
role_id BIGINT REFERENCES roles(role_id),
salary BIGINT


);


CREATE TABLE departments
(
dept_id BIGSERIAL CONSTRAINT dept_id_key PRIMARY KEY,
dept VARCHAR (50) NOT NULL
);

CREATE TABLE roles
(
role_id BIGINT CONSTRAINT role_id_key PRIMARY KEY,
roles VARCHAR(50) NOT NULL
);