SELECT e.emp_no                               AS ID,
       concat(e.first_name, ' ', e.last_name) AS Name,
       t.title                                AS Position,
       t.from_date                            AS 'From',
       t.to_date                              AS 'To',
       if(e.gender = 'F', 'Female', 'Male')   AS Gender,
       e.hire_date                            AS Hired

FROM employees e
         INNER JOIN titles t on e.emp_no = t.emp_no

# WHERE t.to_date >= 9999 - 01 - 01;

ORDER BY e.hire_date ASC;




