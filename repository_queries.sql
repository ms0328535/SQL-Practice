-- Repository: User operations

-- Create user
INSERT INTO users (username)
VALUES ('repository_user')
RETURNING *;

-- Find user
SELECT *
FROM users
WHERE id = 1;

-- Find all users
SELECT *
FROM users
ORDER BY id;

-- Update user
UPDATE users
SET username = 'repository_updated'
WHERE id = 1
RETURNING *;

-- Delete user
DELETE FROM users
WHERE id = 1
RETURNING *;


-- Repository: Post operations

-- Create post
INSERT INTO posts (caption, user_id)
VALUES ('Repository pattern example', 2)
RETURNING *;

-- Find posts for a user
SELECT *
FROM posts
WHERE user_id = 2;

-- Update post
UPDATE posts
SET caption = 'Updated repository post'
WHERE id = 1
RETURNING *;

-- Delete post
DELETE FROM posts
WHERE id = 1
RETURNING *;