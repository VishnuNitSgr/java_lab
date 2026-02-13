
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO employees (name, department, salary, joining_date) VALUES
('Vishnu','IT',60000,'2022-01-10'),
('Rahul','IT',75000,'2021-03-15'),
('Anita','IT',75000,'2023-07-01'),
('Priya','HR',50000,'2020-05-20'),
('Karan','HR',65000,'2022-09-12'),
('Meena','Finance',80000,'2019-11-11'),
('Arjun','Finance',90000,'2021-02-25'),
('Neha','Finance',90000,'2023-06-18');

SELECT 
    id,
    name,
    department,
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;

SELECT 
    id,
    name,
    department,
    salary,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_value,
    DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_rank_value
FROM employees;

SELECT 
    id,
    name,
    department,
    salary,
    SUM(salary) OVER(PARTITION BY department ORDER BY joining_date) AS running_total
FROM employees;

SELECT 
    id,
    name,
    department,
    salary,
    LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS previous_salary,
    LEAD(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS next_salary
FROM employees;

SELECT *
FROM (
    SELECT 
        id,
        name,
        department,
        salary,
        RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_value
    FROM employees
) ranked_data
WHERE rank_value <= 2;

SELECT 
    department,
    name,
    salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg_salary,
    salary - AVG(salary) OVER(PARTITION BY department) AS salary_difference
FROM employees;

SELECT 
    department,
    joining_date,
    SUM(salary) OVER(PARTITION BY department ORDER BY joining_date) AS cumulative_salary_trend
FROM employees;

