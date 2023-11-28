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

-- positions
INSERT INTO positions VALUES (1, "Welder", "01-01-11", 1);
INSERT INTO positions VALUES (10, "Quality Assurance", "07-07-11", 10);
INSERT INTO positions VALUES (20, "Forklift Operator", "07-07-11", 1);

-- start_times
INSERT INTO start_time VALUES ("2002-01-11", 4, 10);
INSERT INTO start_time VALUES ("2007-07-14", 3, 1);
INSERT INTO start_time VALUES ("2007-07-14", 3, 10);
-- scratch --
-- (4)
SELECT location, m.site_ID FROM marketing_site AS m LEFT JOIN sale_history AS s ON m.site_ID = s.Site_ID WHERE s.sale_time = "2011-03-03";
SELECT location, m.site_ID FROM marketing_site AS m LEFT JOIN sale_history AS s ON m.site_ID = s.Site_ID WHERE s.sale_time NOT LIKE "2011-03-%";
UPDATE sale_history SET Site_ID = 10 WHERE `Salesperson` IS NULL; -- duplicate site id

-- (5)
SELECT DISTINCT J_ID, J_Desc FROM positions LEFT JOIN start_time ON E_ID WHERE MONTH(start_time.start_time) > MONTH(positions.date_posted) + 1;

-- Suggested table alterations
ALTER TABLE sale_history MODIFY COLUMN sale_time DATETIME;
ALTER TABLE start_time MODIFY COLUMN start_time DATETIME;

-- INDEXES --
MariaDB [company]> SHOW INDEXES FROM candidate\G
*************************** 1. row ***************************
        Table: candidate
   Non_unique: 0
     Key_name: PRIMARY
 Seq_in_index: 1
  Column_name: Can_ID
    Collation: A
  Cardinality: 0
     Sub_part: NULL
       Packed: NULL
         Null: 
   Index_type: BTREE
      Comment: 
Index_comment: 
1 row in set (0.000 sec)
