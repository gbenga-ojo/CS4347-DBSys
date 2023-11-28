use company;

-- QUERY #1
select interviewers_name, interviewers_ID
from interviewers, interviewees
where interviewees = "Hellen Cole" and interviewees.J_ID = "11111";

-- QUERY #2
select J_ID
from positions as p, department as d
where d.D_Name = "Marketing" and d.D_ID = p.D_ID and p.date_posted like "2011-01-%";

-- QUERY #3
select FName, Lname, E_ID
from employee as e, people as p
where e.S_ID = null and e.E_ID = p.ID

-- QUERY #4
SELECT location, m.site_ID FROM marketing_site AS m
  LEFT JOIN sale_history AS s ON m.site_ID = s.Site_ID
  WHERE s.sale_time NOT LIKE "2011-03-%";


-- QUERY #5
SELECT DISTINCT J_ID, J_Desc FROM positions
  LEFT JOIN start_time ON E_ID
  WHERE MONTH(start_time.start_time) > MONTH(positions.date_posted) + 1;


-- QUERY #6
SELECT DISTINCT Site_ID, Salesperson, price
  FROM sale_history, product
  WHERE price > 200.00;

-- QUERY #7
SELECT department.D_ID, D_Name
  FROM positions, department
  WHERE (date_posted NOT BETWEEN "2011-01-01" AND "2011-02-01");


-- QUERY #8
-- SKIP FOR NOW!!

-- QUERY #9
SELECT Salesperson, COUNT(*) as c
  FROM sale_history
  GROUP BY Salesperson
  ORDER BY c DESC;

-- QUERY #10
SELECT Pr_type, (product.price - parts.price) as net
  FROM product, parts
  GROUP BY Pr_type
  ORDER BY net DESC;

-- QUERY #11
SELECT start_time.D_ID, start_time.E_ID, FName, LName
  FROM start_time LEFT JOIN people
  ON ID = E_ID
  GROUP BY FName, LName
  ORDER BY D_ID desc;


-- QUERY #12


-- QUERY #13


-- QUERY #14


-- QUERY #15
