require 'user'
require_relative 'web_helpers'

feature 'Logging in' do 
  scenario 'Existing user can log in' do
    log_in
    expect(page).to have_current_path("/sessions")
  end

  scenario 'User puts in wrong email address' do 
    User.create(email: 'example@test.com', password: 'password')
    
    visit '/'
    click_link('Login')
    fill_in :email, with: 'wrongexample@test.com'
    fill_in :password, with: 'password'
    click_button 'Login'

    expect(page).to have_content "Please check your email and/or password is correct"
  end

  scenario 'User puts in wrong password' do 
    User.create(email: 'example@test.com', password: 'password')
    
    visit '/'
    click_link('Login')
    fill_in :email, with: 'example@test.com'
    fill_in :password, with: 'wrongpassword'
    click_button 'Login'

    expect(page).to have_content "Please check your email and/or password is correct"
  end
end