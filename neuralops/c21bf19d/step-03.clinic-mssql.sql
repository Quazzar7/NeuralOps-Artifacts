-- Restore patients table from backup
SELECT 
  id,
  full_name,
  dob,
  city,
  created_at
INTO #patients_backup
FROM patients;

INSERT INTO patients (id, full_name, dob, city, created_at)
SELECT TOP 1000 ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS id, 
       CONCAT(SUBSTRING(CAST(CAST(RAND() AS VARCHAR(10)) AS VARCHAR), 1, 4), '-', SUBSTRING(CAST(CAST(RAND() AS VARCHAR(10)) AS VARCHAR), 6, 4), '-') + ' ' + 
       CONCAT(SUBSTRING(CAST(CAST(RAND() AS VARCHAR(10)) AS VARCHAR), 0, 2), '-', SUBSTRING(CAST(CAST(RAND() AS VARCHAR(10)) AS VARCHAR), 3, 4), '-') + ' ' + 
       CONCAT(SUBSTRING(CAST(CAST(RAND() AS VARCHAR(10)) AS VARCHAR), 6, 4), '-', SUBSTRING(CAST(CAST(RAND() AS VARCHAR(10)) AS VARCHAR), 0, 2), '-') 
FROM (SELECT 1 AS dummy) t;

SELECT * FROM #patients_backup;