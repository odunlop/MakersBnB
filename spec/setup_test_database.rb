require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE users, spaces, bookings;")
end

def setup_bookings_table
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE users, spaces, bookings RESTART IDENTITY;")

  connection.exec("INSERT INTO users (email, password) VALUES ('landlord@bigfish.com', 'password1');")
  connection.exec("INSERT INTO users (email, password) VALUES ('holiday-maker@tired.com', 'password2');")

  connection.exec("INSERT INTO spaces (name, description, price, creator) VALUES ('Little Cottage', 'Description', '100', '1');")
  connection.exec("INSERT INTO spaces (name, description, price, creator) VALUES ('Country Manor', 'Description', '250', '1');")
  connection.exec("INSERT INTO spaces (name, description, price, creator) VALUES ('City Apartment', 'Description', '100', '1');")

  connection.exec("INSERT INTO bookings (space_id, date, confirmed, user_id) VALUES ('1', '2022-02-08', 'False', '2');")
  connection.exec("INSERT INTO bookings (space_id, date, confirmed, user_id) VALUES ('2', '2022-02-08', 'False', '2');")
  connection.exec("INSERT INTO bookings (space_id, date, confirmed, user_id) VALUES ('2', '2022-02-09', 'True', '2'); ")

end
