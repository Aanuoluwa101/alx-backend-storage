-- A script that creates a table users following some requirements
-- create a users table on  any database
CREATE TABLE IF NOT EXISTS users (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
        name VARCHAR(255)
);