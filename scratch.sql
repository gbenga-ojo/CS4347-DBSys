-- Start w/ departments, then marketing_sites

INSERT INTO sale_history(Site_ID, C_ID, sale_time, Salesperson, Pr_ID)
  VALUES(1, 1, "2011-03-03", "Jane Doe", "1");

---- Keys
-- Site_id = 1;
-- C_ID = 1;
-- Pr_ID = 1;


-- marketing_sites
INSERT INTO marketing_site (site_ID, site_name, location, D_ID)  VALUES(1, "AlphaSite", "Nevada", 1);
INSERT INTO marketing_site VALUES (10, "BetaSite", "Arizona", 10);

-- department
INSERT INTO department VALUES (1, "Dept1");
INSERT INTO department VALUES (10, "Dept10");

-- people
INSERT INTO people VALUES (1, "female", "Columbus", "OH", "43137", "11111", "22222", "Jane", "Doe", 23);
INSERT INTO people VALUES (2, "male", "Columbus", "OH", "43125", "33333", "44444", "Little", "John", 43);
INSERT INTO people VALUES (3, "male", "Dallas", "TX", "43125", "55555", "66666", "Brazen", "Saddle", 21);
INSERT INTO people VALUES (4, "female", "Dallas", "TX", "75244", "77777", "88888", "Sally", "Sue", 45);

-- customers
INSERT INTO customer VALUES (1, "Subject Dawn");
INSERT INTO customer VALUES (2, "Rigel Orion");

-- employees
INSERT INTO employee (E_ID, E_Rank, title) VALUES (1, "third-tier", "CFO");
INSERT INTO employee (E_ID, E_Rank, title) VALUES (2, "second-tier", "CTO");
INSERT INTO employee (E_ID, E_Rank, title) VALUES (3, "first-tier", "CEO");
INSERT INTO employee (E_ID, E_Rank, title, D_ID) VALUES (4, "null-tier", "Chief Councel", 10);

-- sale_history
INSERT INTO sale_history (Site_ID, C_ID, sale_time, Pr_ID) VALUES (1, 1, '11-12-23', 100);
INSERT INTO sale_history(Site_ID, C_ID, sale_time, Salesperson, Pr_ID) VALUES(1, 1, "2011-03-03", "Jane Doe", 100);

-- scratch --
-- (4)
SELECT location, m.site_ID FROM marketing_site AS m LEFT JOIN sale_history AS s ON m.site_ID = s.Site_ID WHERE s.sale_time = "2011-03-03";
SELECT location, m.site_ID FROM marketing_site AS m LEFT JOIN sale_history AS s ON m.site_ID = s.Site_ID WHERE s.sale_time NOT LIKE "2011-03-%";
UPDATE sale_history SET Site_ID = 10 WHERE `Salesperson` IS NULL; -- duplicate site id

-- Suggested table alterations
ALTER TABLE sale_history MODIFY COLUMN sale_time DATETIME;
