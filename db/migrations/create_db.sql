CREATE DATABASE makersbnb;
-- navigate to db using \c makersbnb;
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));
CREATE TABLE spaces (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(140), price VARCHAR(60));
ALTER TABLE spaces ADD creator VARCHAR(60);
 