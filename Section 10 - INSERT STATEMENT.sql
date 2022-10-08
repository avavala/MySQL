### INSERT exercises ###
SELECT * FROM titles
LIMIT 10
;

INSERT INTO employees 
 VALUES (
	999903,
    '1977-03-04',
    'Johnatan',
    'Creek',
    'M',
    '1999-01-01'
    
)
;

INSERT INTO titles (
	emp_no,
    title,
    from_date
)
 VALUES (
	999903,
    'Senior Engineer',
    '1997-10-01'
)
;

SELECT * FROM titles
ORDER BY emp_no DESC
LIMIT 10
;

-- Insert information about the individual with employee number 999903 into the “dept_emp” table. 
-- He/She is working for department number 5, and has started work on  October 1st, 1997; 
-- her/his contract is for an indefinite period of time.

INSERT INTO dept_emp 
VALUES 
	(
		999903,
		'd005',
		'1997-10-01',
		'9999-10-01'
	)
;

-- Create a new department called “Business Analysis”. Register it under number ‘d010’.
INSERT INTO departments 
(
	dept_no,
    dept_name
    )
VALUES 
(
	'd010',
    'Business Analysis'
)
;

SELECT * FROM departments
