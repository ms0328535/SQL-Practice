-- API: Get all users
SELECT *
FROM users;

-- API: Get a user by ID
SELECT *
FROM users
WHERE id = 1;

-- API: Create a user
INSERT INTO users (username)
VALUES ('new_user')
RETURNING *;

-- API: Update a user
UPDATE users
SET username = 'updated_user'
WHERE id = 1
RETURNING *;

-- API: Delete a user
DELETE FROM users
WHERE id = 1
RETURNING *;

-- API: Get posts for a user
SELECT
    p.id,
    p.caption,
    u.username
FROM posts p
JOIN users u
    ON p.user_id = u.id
WHERE u.id = 2;

-- API: Pagination
SELECT *
FROM posts
ORDER BY id
LIMIT 10 OFFSET 0;