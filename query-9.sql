# query-9-test
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
       concat(em.first_name, ' ', em.last_name) AS Manager,
       s.salary                                 AS Salary

FROM employees e
         JOIN titles t ON e.emp_no = t.emp_no
         JOIN dept_emp de ON e.emp_no = de.emp_no
         JOIN departments d ON de.dept_no = d.dept_no
         JOIN dept_manager dm ON d.dept_no = dm.dept_no
         JOIN employees em ON dm.emp_no = em.emp_no
         JOIN salaries s ON em.emp_no = s.emp_no

         JOIN (SELECT tit.emp_no,
                      MAX(tit.to_date) AS max_title_to_date
               FROM titles tit
               GROUP BY tit.emp_no) AS tit ON tit.emp_no = e.emp_no

WHERE t.to_date >= curdate()
  AND de.to_date >= curdate()
  AND dm.to_date >= curdate()
#   AND s.to_date >= curdate()
ORDER BY ID;

#query-9
SELECT e.emp_no                               AS ID,
       concat(e.first_name, ' ', e.last_name) AS Name,
       t.title                                AS Position,
       t.from_date                            AS "From",
       t.to_date                              AS "To",
       if(e.gender = 'm', 'Male', 'Female')   AS Gender,
       e.hire_date                            AS Hired,
       d.dept_name                            AS Department
#         contact

FROM employees e
         JOIN (SELECT emp_no,
                      max(titles.to_date) AS titles_max_to_date
               FROM titles
               GROUP BY emp_no) last_title ON last_title.emp_no = e.emp_no
         JOIN titles t ON t.emp_no = e.emp_no AND t.to_date = last_title.titles_max_to_date

         JOIN dept_emp de ON e.emp_no = de.emp_no
         JOIN departments d ON de.dept_no = d.dept_no

         JOIN (SELECT emp_no,
                      max(dept_manager.to_date) AS dept_manager_max_to_date
               FROM dept_manager
               GROUP BY emp_no) last_department ON last_department.emp_no = e.emp_no
         JOIN dept_manager dm ON dm.emp_no = e.emp_no AND dm.to_date = last_department.dept_manager_max_to_date

    #          JOIN dept_manager dm ON d.dept_no = dm.dept_no
         JOIN employees em ON dm.emp_no = em.emp_no
         JOIN salaries s ON em.emp_no = s.emp_no
;

