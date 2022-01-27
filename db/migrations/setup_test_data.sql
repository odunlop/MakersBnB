
TRUNCATE users, spaces, bookings RESTART IDENTITY;

INSERT INTO users (email, password) VALUES ('landlord@bigfish.com', 'password1'); -- As we restarted identity this user will be assigned id of '1'
INSERT INTO users (email, password) VALUES ('holiday-maker@tired.com', 'password2'); -- And this user will be assigned id of '2'

INSERT INTO spaces (name, description, price, creator) VALUES ('Little Cottage', 'Description', '100', '1'); -- Will be assigned id of '1'
INSERT INTO spaces (name, description, price, creator) VALUES ('Country Manor', 'Description', '250', '1'); -- id will be '2'
INSERT INTO spaces (name, description, price, creator) VALUES ('City Apartment', 'Description', '100', '1'); -- id will be '3'

INSERT INTO bookings (space_id, date, confirmed, user_id) VALUES ('1', '2022-02-08', 'False', '2'); -- Space 1 is booked on 8th Feb by User 2
INSERT INTO bookings (space_id, date, confirmed, user_id) VALUES ('2', '2022-02-08', 'False', '2'); -- Space 2 is booked on 8th Feb by User 2
INSERT INTO bookings (space_id, date, confirmed, user_id) VALUES ('2', '2022-02-09', 'True', '2'); -- Space 2 is booked on 8th Feb by User 2

-- get_availability(space_id = 2) -- might be better to call this get_bookings
SELECT date FROM bookings WHERE space_id = 2;
-- Should return two rows with 8th and 9th Feb

-- Get Date Range as an array eg [“2022-02-01”, “2022-02-02”, “2022-02-03”, “2022-02-04”, “2022-02-05”, “2022-02-06”, “2022-02-07”] - possibly using a combination of Date function and .map
-- Loop through the array with .each
-- if date == date_returned_from_DB
--   means date not available
--   print date + “Unavailable”
-- else
-- print date + “Click here to book”
-- end


-- get_spaces(date = ‘2022-02-09’)
SELECT * FROM spaces WHERE id NOT IN (SELECT spaces.id FROM spaces INNER JOIN bookings ON spaces.id = bookings.space_id WHERE date = '2022-02-09');
-- Should return two rows with Little Cottage and City Apartment as these are the spaces with no bookings on 9th Feb
