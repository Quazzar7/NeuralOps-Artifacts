-- Step to restore the patients table from backup
SELECT 
    patients.id, 
    patients.full_name, 
    patients.dob, 
    patients.city, 
    patients.created_at
FROM 
    (SELECT id, full_name, dob, city, created_at FROM patients ORDER BY created_at DESC LIMIT 10) AS latest_backups;

-- Create a temporary table to hold the restore data
CREATE TABLE #restore_patients (
    id int NOT NULL PRIMARY KEY,
    full_name varchar(255) NOT NULL,
    dob date NOT NULL,
    city varchar(255) NOT NULL,
    created_at date NOT NULL
);

-- Insert into #restore_patients
INSERT INTO #restore_patients (id, full_name, dob, city, created_at)
SELECT id, full_name, dob, city, created_at FROM patients;

-- Copy data from #restore_patients to TestTable1
DROP TABLE IF EXISTS TestTable1;
CREATE TABLE TestTable1 (
    id int NOT NULL PRIMARY KEY,
    full_name varchar(255) NOT NULL,
    dob date NOT NULL,
    city varchar(255) NOT NULL,
    created_at date NOT NULL
);

INSERT INTO TestTable1 (id, full_name, dob, city, created_at)
SELECT id, full_name, dob, city, created_at FROM #restore_patients;

-- Drop #restore_patients and delete original backup table
DROP TABLE #restore_patients;
TRUNCATE patients;