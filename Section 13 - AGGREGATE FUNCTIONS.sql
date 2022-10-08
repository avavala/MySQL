###########################
### AGGREGATE FUNCTIONS ###
###########################

-- How many departments are there in the “employees” database?
SELECT COUNT(DISTINCT dept_no)
FROM departments
;

-- What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
SELECT SUM(salary) FROM salaries
WHERE from_date > '1997-01-01'
;

-- Which is the lowest employee number in the database?
SELECT MIN(emp_no)
FROM employees;

-- Which is the highest employee number in the database?
SELECT MAX(emp_no)
FROM employees;

-- What is the average annual salary paid to employees who started after the 1st of January 1997?
SELECT AVG(salary)
FROM salaries
WHERE from_date > '1997-01-01'
;

-- Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
SELECT ROUND(AVG(salary),2)
FROM salaries
WHERE from_date > '1997-01-01'
;

##################################
####### IFNULL and COALESCE ######
CREATE TABLE departments_dup AS SELECT * FROM departments;
ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

ALTER TABLE employees.departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;
COMMIT;

-- Select the department number and name from the ‘departments_dup’ table and add a third column 
-- where you name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’.

SELECT dept_no, dept_name,
		COALESCE(dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no ASC;

SELECT IFNULL(dept_no, 'N/A') as dept_no,
IFNULL(dept_name,
	'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no ASC;



