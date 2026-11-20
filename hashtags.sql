CREATE TABLE hashtags (
    id SERIAL PRIMARY KEY,
    tag VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE hashtag_posts (
    id SERIAL PRIMARY KEY,
    hashtag_id INT REFERENCES hashtags(id)
        ON DELETE CASCADE,
    post_id INT REFERENCES posts(id)
        ON DELETE CASCADE,
    UNIQUE(hashtag_id, post_id)
);

INSERT INTO hashtags (tag)
VALUES
('#postgresql'),
('#sql'),
('#database');

INSERT INTO hashtag_posts (hashtag_id, post_id)
VALUES
(1, 1),
(2, 1),
(3, 2);

-- Display hashtags
SELECT * FROM hashtags;

-- Display hashtags associated with posts
SELECT
    p.id AS post_id,
    p.caption,
    h.tag
FROM posts p
JOIN hashtag_posts hp ON p.id = hp.post_id
JOIN hashtags h ON h.id = hp.hashtag_id;

-- Count posts for each hashtag
SELECT
    h.tag,
    COUNT(hp.post_id) AS total_posts
FROM hashtags h
LEFT JOIN hashtag_posts hp
    ON h.id = hp.hashtag_id
GROUP BY h.id, h.tag;