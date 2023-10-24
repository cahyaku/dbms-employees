SELECT e.emp_no                               AS ID,
       concat(e.first_name, ' ', e.last_name) AS Name,
       t.title                                AS Position,
       t.from_date                            AS 'From',
       t.to_date                              AS 'To',
       if(e.gender = 'F', 'Female', 'Male')   AS Gender,
       e.hire_date                            AS Hired,
       d.dept_name                            AS Department,
       de.from_date                           AS 'Assigned From',
       de.to_date                             AS 'Assigned to'

FROM employees e
         INNER JOIN titles t ON e.emp_no = t.emp_no
         INNER JOIN dept_emp de ON e.emp_no = de.emp_no
         INNER JOIN departments d ON de.dept_no = d.dept_no

WHERE t.to_date >= curdate()

ORDER BY ID;




