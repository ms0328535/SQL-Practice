-- Migration 001: Create users table

CREATE TABLE IF NOT EXISTS app_users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Migration 002: Add created_at column

ALTER TABLE app_users
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- Migration 003: Add status column

ALTER TABLE app_users
ADD COLUMN status VARCHAR(20) DEFAULT 'active';

-- Migration 004: Create posts table

CREATE TABLE IF NOT EXISTS app_posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    user_id INT REFERENCES app_users(id)
        ON DELETE CASCADE
);

-- Check table structure
SELECT *
FROM information_schema.columns
WHERE table_name = 'app_users';

-- Rollback migration 004
DROP TABLE IF EXISTS app_posts;

-- Rollback migration 003
ALTER TABLE app_users
DROP COLUMN IF EXISTS status;

-- Rollback migration 002
ALTER TABLE app_users
DROP COLUMN IF EXISTS created_at;