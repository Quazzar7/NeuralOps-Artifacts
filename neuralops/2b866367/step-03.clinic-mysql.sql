-- Backup patients table
CREATE TABLE patients_backup_${BACKUP_TS} LIKE patients;
INSERT INTO patients_backup_${BACKUP_TS}
SELECT * FROM patients;