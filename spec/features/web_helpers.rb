require 'user'

def log_in
  User.create(email: 'example@test.com', password: 'password')
    
  visit '/'
  find('#login').click
  fill_in :email, with: 'example@test.com'
  fill_in :password, with: 'password'
  click_button 'Login'
end

def list_panda_space
  click_button 'Add Space'
  fill_in :name, with: 'Panda Space'
  fill_in :description, with: 'Panda fun for Team Panda'
  fill_in :price, with: '500'
  click_button 'List my space'
end

def misc_spaces
  DatabaseConnection.query(
      "INSERT INTO spaces (name, description, price, creator) values ($1, $2, $3, $4);", ['Space1', "The first space", "100", 1]
    )
    DatabaseConnection.query(
      "INSERT INTO spaces (name, description, price, creator) values ($1, $2, $3, $4);", ['Space2', "The second space", "200", 1]
    )
end