-- Backup Table Migration
SELECT * INTO OUTFILE '/backup/table.sql' FROM ${TABLE_NAME};