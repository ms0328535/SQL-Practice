-- Create testing table

CREATE TABLE test_users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Test 1: Insert valid record

BEGIN;

INSERT INTO test_users (username, email)
VALUES ('test_user1', 'test1@example.com');

SELECT * FROM test_users;

ROLLBACK;


-- Test 2: Insert another valid record

BEGIN;

INSERT INTO test_users (username, email)
VALUES ('test_user2', 'test2@example.com');

SELECT * FROM test_users;

ROLLBACK;


-- Test 3: Verify duplicate username constraint

BEGIN;

INSERT INTO test_users (username, email)
VALUES ('test_user3', 'test3@example.com');

SAVEPOINT before_duplicate;

-- This insert violates the unique constraint
INSERT INTO test_users (username, email)
VALUES ('test_user3', 'another@example.com');

ROLLBACK TO SAVEPOINT before_duplicate;

COMMIT;


-- Verify final table
SELECT * FROM test_users;