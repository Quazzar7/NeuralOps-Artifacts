-- List all tables in the PostgreSQL database
SELECT tablename 
FROM pg_tables 
WHERE schemaname != 'pg_catalog' AND schemaname != 'information_schema';