SELECT e.emp_no                                 AS ID,
       concat(e.first_name, ' ', e.last_name)   AS Name,
       t.title                                  AS Position,
       t.from_date                              AS 'From',
       t.to_date                                AS 'To',
       if(e.gender = 'F', 'Female', 'Male')     AS Gender,
       e.hire_date                              AS Hired,
       d.dept_name                              AS Department,
       de.from_date                             AS 'Assigned From',
       de.to_date                               AS 'Assigned to',
       concat(em.first_name, ' ', em.last_name) AS Manager

FROM employees e
         INNER JOIN titles t ON e.emp_no = t.emp_no
         INNER JOIN dept_emp de ON e.emp_no = de.emp_no
         INNER JOIN departments d ON de.dept_no = d.dept_no

         INNER JOIN dept_manager dm ON d.dept_no = dm.dept_no
         INNER JOIN employees em ON dm.emp_no = em.emp_no

WHERE t.to_date >= curdate()
  AND de.to_date >= curdate()
  AND dm.to_date >= curdate()
ORDER BY ID;