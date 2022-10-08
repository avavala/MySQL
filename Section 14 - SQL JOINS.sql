ALTER TABLE departments_dup
  DROP COLUMN dept_manager;

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
	emp_no int(11) NOT NULL,
	dept_no char(4) NULL,
	from_date date NOT NULL,
	to_date date NULL
  );

 

INSERT INTO dept_manager_dup
select * from dept_manager;
	INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES
	(999904, '2017-01-01'),
    (999905, '2017-01-01'),
    (999906, '2017-01-01'),
    (999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';

INSERT INTO departments_dup (dept_name)
	VALUES ('Public Relations');

DELETE FROM departments_dup
WHERE dept_no = 'd002'; 

########################################################################

###################
###### JOINS ######
###################

-- Extract a list containing information about all managers’ employee number, first and last name, 
-- department number, and hire date. 

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, d.dept_no
	FROM employees e
INNER JOIN 
	dept_manager d ON e.emp_no = d.emp_no
ORDER BY 1;

-- Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. 
-- See if the output contains a manager with that name.
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no
	FROM employees e 
		LEFT JOIN dept_manager dm on e.emp_no  = dm.emp_no
        WHERE e.last_name = "Markovitch"
ORDER BY dm.dept_no DESC, e.emp_no;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

-- Select the first and last name, the hire date, and the job title of all employees whose first name is “Margareta” 
-- and have the last name “Markovitch”.
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
	FROM employees e 
		JOIN titles t on e.emp_no  = t.emp_no
        WHERE e.last_name = "Markovitch" AND first_name = "Margareta"
        ORDER BY e.emp_no
        ;

-- Use a CROSS JOIN to return a list with all possible combinations between managers from 
-- the dept_manager table and department number 9.
SELECT dm.*, d.*
	FROM dept_manager dm
		CROSS JOIN departments d
        WHERE d.dept_no = 'd009';
        
-- Return a list with the first 10 employees with all the departments they can be assigned to.
SELECT e.*, d.*
FROM employees e
	CROSS JOIN departments d
    WHERE emp_no < 10011
    ORDER BY e.emp_no, d.dept_name;



