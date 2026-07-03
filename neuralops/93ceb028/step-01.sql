-- Create TestTable1 and insert mock data
CREATE TABLE IF NOT EXISTS neuralops.test_table1 (
  id text NOT NULL,
  type text NOT NULL,
  priority text NOT NULL,
  status text NOT NULL,
  payload jsonb NOT NULL,
  result jsonb,
  artifact_key text,
  traceparent text,
  error text,
  attempts integer NOT NULL,
  max_retries integer NOT NULL,
  created_at timestamp with time zone NOT NULL,
  updated_at timestamp with time zone NOT NULL,
  checkpoint jsonb,
  gate text,
  approval text
);

-- Insert mock data into TestTable1
INSERT INTO neuralops.test_table1 (
  id, type, priority, status, payload, result, artifact_key, traceparent, error, attempts, max_retries, created_at, updated_at, checkpoint, gate, approval
)
VALUES 
  ('job_123', 'echo', 'high', 'running', '{"key": "value"}', '{}', 'minio-object-key-1', '0.0.0.0/000001', '', 0, 10, '2023-01-01T12:00:00Z', '2023-01-01T12:00:01Z', '{}', 'Test Gate', 'Approved'),
  ('job_456', 'sleep', 'default', 'waiting_approval', '{"key": "value"}', '{}', 'minio-object-key-2', '0.0.0.0/000002', '', 0, 10, '2023-01-01T12:00:02Z', '2023-01-01T12:00:03Z', '{}', 'Test Gate', 'Rejected'),
  ('job_789', 'fail', 'low', 'failed', '{"key": "value"}', '{}', 'minio-object-key-3', '0.0.0.0/000003', 'Error message', 2, 10, '2023-01-01T12:00:04Z', '2023-01-01T12:00:05Z', '{}', 'Test Gate', '');

-- Create TestTable2 and copy data from TestTable1
CREATE TABLE IF NOT EXISTS neuralops.test_table2 (
  id text NOT NULL,
  type text NOT NULL,
  priority text NOT NULL,
  status text NOT NULL,
  payload jsonb NOT NULL,
  result jsonb,
  artifact_key text,
  traceparent text,
  error text,
  attempts integer NOT NULL,
  max_retries integer NOT NULL,
  created_at timestamp with time zone NOT NULL,
  updated_at timestamp with time zone NOT NULL,
  checkpoint jsonb,
  gate text,
  approval text
);

INSERT INTO neuralops.test_table2 (
  id, type, priority, status, payload, result, artifact_key, traceparent, error, attempts, max_retries, created_at, updated_at, checkpoint, gate, approval
)
SELECT * FROM neuralops.test_table1;

-- Select all rows in TestTable2
SELECT * FROM neuralops.test_table2;