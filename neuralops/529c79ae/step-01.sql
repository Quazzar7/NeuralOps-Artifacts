-- Step to perform: Generate a single idempotent PostgreSQL SQL script
CREATE TABLE IF NOT EXISTS TestTable1 (
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

INSERT INTO TestTable1 (id, type, priority, status, payload, result, artifact_key, traceparent, error, attempts, max_retries, created_at, updated_at, checkpoint, gate, approval)
VALUES (
  'job_123',
  'echo',
  'high',
  'succeeded',
  '{"key": "value"}',
  NULL,
  'object-key-123',
  '0x1234567890abcdef',
  NULL,
  1,
  3,
  '2022-01-01 12:00:00+00',
  '2022-01-01 12:05:00+00',
  NULL,
  NULL,
  NULL
),
(
  'job_456',
  'sleep',
  'low',
  'queued',
  '{"key": "value"}',
  NULL,
  'object-key-456',
  '0x234567890abcdefg',
  NULL,
  2,
  3,
  '2022-01-01 12:10:00+00',
  '2022-01-01 12:15:00+00',
  NULL,
  NULL,
  NULL
),
(
  'job_789',
  'fail',
  'default',
  'failed',
  '{"key": "value"}',
  '{"error": "message"}',
  'object-key-789',
  '0x3456789012345678',
  'Error message',
  3,
  2,
  '2022-01-01 12:20:00+00',
  '2022-01-01 12:25:00+00',
  NULL,
  NULL,
  'rejected'
);

CREATE TABLE IF NOT EXISTS TestTable2 (
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

INSERT INTO TestTable2 (SELECT * FROM TestTable1);
 
SELECT * FROM TestTable2;