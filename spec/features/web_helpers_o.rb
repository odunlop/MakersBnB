require 'user'

def log_in
  User.create(email: 'example@test.com', password: 'password')
    
  visit '/'
  find('#login').click
  fill_in :email, with: 'example@test.com'
  fill_in :password, with: 'password'
  click_button 'Login'
end