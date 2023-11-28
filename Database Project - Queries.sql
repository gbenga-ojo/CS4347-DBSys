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


-- QUERY #8


-- QUERY #9


-- QUERY #10


-- QUERY #11


-- QUERY #12


-- QUERY #13


-- QUERY #14


-- QUERY #15
