-- RESTORE PATIENTS TABLE FROM BACKUP
CREATE TABLE patients (
  id uuid NOT NULL,
  name text NOT NULL,
  email text NOT NULL,
  phone text,
  address text,
  created_at timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO patients (id, name, email)
VALUES ('123e4567-e89b-12d3-a456-426614174000', 'John Doe', 'john.doe@example.com'),
       ('234e5678-f89b-12d3-a456-426614174001', 'Jane Doe', 'jane.doe@example.com')