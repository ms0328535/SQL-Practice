-- Create bank accounts
CREATE TABLE bank_accounts (
    id SERIAL PRIMARY KEY,
    account_holder VARCHAR(100),
    balance NUMERIC(12, 2)
        CHECK(balance >= 0)
);

INSERT INTO bank_accounts
(account_holder, balance)
VALUES
('Murali', 10000),
('Arun', 5000);

-- Transaction
BEGIN;

UPDATE bank_accounts
SET balance = balance - 1000
WHERE id = 1;

UPDATE bank_accounts
SET balance = balance + 1000
WHERE id = 2;

COMMIT;

-- Rollback example
BEGIN;

UPDATE bank_accounts
SET balance = balance - 500
WHERE id = 1;

ROLLBACK;

-- Savepoint example
BEGIN;

UPDATE bank_accounts
SET balance = balance - 200
WHERE id = 1;

SAVEPOINT transfer_point;

UPDATE bank_accounts
SET balance = balance + 200
WHERE id = 2;

ROLLBACK TO SAVEPOINT transfer_point;

COMMIT;

-- Check final balances
SELECT * FROM bank_accounts;