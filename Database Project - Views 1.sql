use company;

-- VIEW #1
create view avg_salary
as select e_id, avg(amount) as salary
from pay
group by e_id;

-- VIEW #2
create view interviews_passed
as select Can_ID, num_passed
from grades;

-- VIEW #3
create view num_product_sold
as select Pr_ID, count(Pr_ID)
from sale_history
group by pr_id;

-- VIEW #4
create view product_price
as select used_in, price * amount as price
from parts_use, parts
where price in (
	select price
    from parts as p, parts_use as u
    where p.Pa_ID = u.Pa_ID
)
group by used_in;