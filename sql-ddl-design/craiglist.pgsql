DROP DATABASE craiglist_db;
CREATE DATABASE craiglist_db;
\c craiglist_db;

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    region_name TEXT
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category_name TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT, 
    preferred_region INTEGER REFERENCES regions
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(30),
    text_post TEXT,
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions,
    category_id INTEGER REFERENCES categories
);

INSERT INTO regions 
(region_name)
VALUES
('Toronto'), 
('Vancouver'),
('Montreal'),
('Calgary');

INSERT INTO categories
(category_name)
VALUES
('Rentals'),
('Furniture'),
('Technology'),
('Art'),
('Cars');

INSERT INTO users 
(username, preferred_region)
VALUES
('Yellow123', 3), 
('JohnSmith', 1),
('Gardening55', 2),
('Sammy', 4);

INSERT INTO posts 
(title, text_post, user_id, region_id, category_id)
VALUES
('Selling flower paints', 'I am selling my flower paints. The price is below each one. I can do delivery nearby,', 1,3,4 ),
('Rent room for students', 'Renting room for students near downtown.', 2,1,1);





