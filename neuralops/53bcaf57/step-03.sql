-- Backup patients table in MySQL
CREATE TABLE patients_backup_${BACKUP_TIMESTAMP} LIKE patients;
INSERT INTO patients_backup_${BACKUP_TIMESTAMP}
SELECT * FROM patients;

-- Backup patients table in SQL Server
SELECT *
INTO patients_backup_${BACKUP_TIMESTAMP}
FROM patients;