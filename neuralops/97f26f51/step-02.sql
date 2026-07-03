-- List all user-defined tables in the current PostgreSQL database
SELECT tablename
FROM pg_tables
WHERE schemaname NOT IN ('pg_catalog', 'information_schema')
ORDER BY schemaname, tablename;