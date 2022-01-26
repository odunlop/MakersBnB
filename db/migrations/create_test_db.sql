CREATE DATABASE makersbnb_test;
-- navigate to db using \c makersbnb_test;
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));
CREATE TABLE spaces (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(140), price VARCHAR(60));
ALTER TABLE spaces ADD creator VARCHAR(60);

CREATE TABLE bookings (id SERIAL PRIMARY KEY, space_id INTEGER REFERENCES spaces (id), date DATE, confirmed BOOLEAN, user_id INTEGER REFERENCES users (id));