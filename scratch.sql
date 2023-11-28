INSERT INTO sale_history(Site_ID, C_ID, sale_time, Salesperson, Pr_ID)
  VALUES(1, 1, "2011-03-03", "Jane Doe", "1");

---- Keys
-- Site_id = 1;
-- C_ID = 1;
-- Pr_ID = 1;


-- marketing_sites
INSERT INTO marketing_site (site_ID, site_name, location, D_ID)  VALUES(1, "AlphaSite", "Nevada", 1);
INSERT INTO marketing_site VALUE(site_ID, site_name, location, D_ID)
  VALUE(1, "AlphaSite", "Nevada", 1);

-- department
INSERT INTO department VALUES (1, "Dept1");

-- people
INSERT INTO people VALUES (1, "female", "Columbus", "OH", "43137", "11111", "22222", "Jane", "Doe", 23);
INSERT INTO people VALUES (2, "male", "Columbus", "OH", "43125", "33333", "44444", "Little", "John", 43);

-- customers
INSERT INTO customer VALUES (1, "Subject Dawn");
INSERT INTO customer VALUES (2, "Rigel Orion");

-- employees
INSERT INTO employee (E_ID, E_Rank, title) VALUES (1, "third-tier", "CFO");

-- sale_history
INSERT INTO sale_history (Site_ID, C_ID, sale_time, Pr_ID) VALUES (1, 1, '11-12-23', 100);
INSERT INTO sale_history(Site_ID, C_ID, sale_time, Salesperson, Pr_ID) VALUES(1, 1, "2011-03-03", "Jane Doe", 100);


-- Necessary table alterations
ALTER TABLE sale_history MODIFY COLUMN sale_time DATETIME;
