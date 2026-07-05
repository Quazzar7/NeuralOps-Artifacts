-- Backup patients table to a timestamped copy
DECLARE @backupTableName sysname = N'patients_backup_' + CONVERT(char(8), GETDATE(), 112) + '_' + REPLACE(CONVERT(varchar(8), GETDATE(), 108), ':', '');
DECLARE @sql nvarchar(max) = N'SELECT id, full_name, dob, city, created_at INTO ' + QUOTENAME(@backupTableName) + N' FROM patients;';
EXEC sp_executesql @sql;