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
where e.S_ID = null and e.E_ID = p.ID;

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
select e.E_ID, p.Fname, p.Lname, e.D_ID
from employee as e, people as p, applies_to as a
where a.J_ID = "12345" and a.Can_ID = e.E_ID;

-- QUERY #9
SELECT Salesperson, COUNT(*) as c
  FROM sale_history
  GROUP BY Salesperson
  ORDER BY c DESC;

-- QUERY #10
SELECT Pr_type, (product.price - product_price.price) as net
  FROM product, product_price
  GROUP BY Pr_type
  ORDER BY net DESC;

-- QUERY #11
select FName, LName, E_ID
from start_time as s, people as p,
-- calculates the number of departments each employee has worked for
	(select count(D_ID) as emp_total
    from start_time
    group by E_ID) as i,
-- calculates the total number of departments
    (select count(*) as total
    from department) as n
where i.emp_total = n.total;

-- QUERY #12
SELECT Can_id, FName, LName, email
  FROM grades LEFT JOIN people on Can_id = ID
  WHERE average >= 70 AND num_passed >= 5;

-- QUERY #13
select distinct Can_ID, FName, LName, line1, email
from people, grades
where Can_ID not in (
	select distinct Can_ID
    from grades
    where average < 70 and num_passed < 5
);

-- QUERY #14
select FName, LName, E_ID
from people, avg_salary
where E_ID in (
	select max(salary)
    from avg_salary
);

-- QUERY #15
select V_ID, Vname, price
from vendor, parts
where Pa_Name = "Cup" and weight < 4;