-- Create TestTable1 if not exists, insert mock data and select all rows
CREATE TABLE IF NOT EXISTS TestTable1 (
  id text NOT NULL PRIMARY KEY,
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

INSERT INTO TestTable1 (id, type, priority, status, payload, result, artifact_key, traceparent, error, attempts, max_retries, created_at, updated_at, checkpoint, gate, approval)
VALUES 
('job_123', 'echo', 'high', 'running', '{"key": "value"}', '{}', '${ARTIFACT_KEY}', '0.00.0.1/01', null, 1, 3, '2022-01-01T12:00:00+02:00', '2022-01-01T12:00:10+02:00', '{}', 'Echo handler', 'Approval pending'),
('job_456', 'sleep', 'default', 'waiting_approval', '{"key": "value"}', '{}', '${ARTIFACT_KEY}', '0.00.0.1/02', null, 1, 3, '2022-01-01T12:00:00+02:00', '2022-01-01T12:00:10+02:00', '{}', 'Sleep handler', 'Approval pending'),
('job_789', 'fail', 'low', 'failed', '{"key": "value"}', '{"error": "Failed to process"}', '${ARTIFACT_KEY}', '0.00.0.1/03', 'Error processing failed', 2, 3, '2022-01-01T12:00:00+02:00', '2022-01-01T12:00:10+02:00', '{}', 'Fail handler', 'Failed'),
('job_012', 'workflow', 'high', 'succeeded', '{"key": "value"}', '{"result": "Success!"}', '${ARTIFACT_KEY}', '0.00.0.1/04', null, 2, 3, '2022-01-01T12:00:00+02:00', '2022-01-01T12:00:10+02:00', '{}', 'Workflow handler', 'Success approved');

-- Copy all rows from TestTable1 to TestTable2
CREATE TABLE IF NOT EXISTS TestTable2 (
  id text NOT NULL PRIMARY KEY,
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

INSERT INTO TestTable2 SELECT * FROM TestTable1;

-- Select all rows in TestTable2
SELECT * FROM TestTable2;