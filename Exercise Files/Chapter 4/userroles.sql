-- View Tables from the SuperUser viewpoint
SELECT * FROM manufacturing.products;
SELECT * FROM human_resources.employees;

-- Impersonate the hr manager
SET ROLE hr_manager;

-- Switch permissions back to postgres super user
RESET ROLE;

-- Give the hr manager role permissions in database
GRANT USAGE ON SCHEMA human_resources TO hr_manager;
GRANT SELECT ON ALL TABLES IN SCHEMA human_resources TO hr_manager;
GRANT ALL ON ALL TABLES IN SCHEMA human_resources TO hr_manager;

-- Remove the hr manager role from Postgres server
RESET ROLE;
REVOKE ALL ON ALL TABLES IN SCHEMA human_resources FROM hr_manager;
REVOKE USAGE ON SCHEMA human_resources FROM hr_manager;
DROP ROLE hr_manager;