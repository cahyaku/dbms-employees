SELECT (emp_no)                           AS ID,
       CONCAT(first_name, ' ', last_name) AS Name,
       IF(gender = "F", "Female", "Male") AS GENDER,
       (hire_date)                        AS HIRED
FROM employees
ORDER BY hire_date ASC
;

