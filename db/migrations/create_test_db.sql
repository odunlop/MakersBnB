CREATE DATABASE makersbnb_test;
-- navigate to db using \c makersbnb_test;
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));
CREATE TABLE spaces (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(140), price VARCHAR(60));

 