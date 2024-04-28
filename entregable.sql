CREATE DATABASE blog_db;
USE blog_db;	
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    creator_id INT,
    title VARCHAR(255),
    text TEXT,
    likes INT,
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    post_id INT,
    date_time DATE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);
INSERT INTO users (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Michael', 'Johnson', 'michael.johnson@example.com'),
('Emily', 'Williams', 'emily.williams@example.com'),
('David', 'Brown', 'david.brown@example.com');

INSERT INTO posts (creator_id, title, text, likes) VALUES
(1, 'First Post', 'This is the first post text.', 10),
(2, 'Second Post', 'This is the second post text.', 15),
(3, 'Third Post', 'This is the third post text.', 20),
(4, 'Fourth Post', 'This is the fourth post text.', 8),
(5, 'Fifth Post', 'This is the fifth post text.', 12);

INSERT INTO likes (user_id, post_id, date_time) VALUES
(1, 1, NOW()),
(2, 2, NOW()),
(3, 3, NOW()),
(4, 4, NOW()),
(5, 5, NOW());
SELECT*FROM users 
INNER JOIN posts
ON users.id=posts.creator_id;

SELECT*FROM likes
INNER JOIN posts INNER JOIN users
ON likes.user_id=users.id=posts.creator_id;


