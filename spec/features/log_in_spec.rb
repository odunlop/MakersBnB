require 'user'

feature 'Logging in' do 
  scenario 'Existing user can log in' do
    User.create(email: 'example@test.com', password: 'password')
    
    visit '/'
    find('#login').click
    fill_in :email, with: 'example@test.com'
    fill_in :password, with: 'password'
    click_button 'Login'
    expect(page).to have_content "You're now logged in!"
    expect(page).to have_button 'View Spaces'
  end

  scenario 'User puts in wrong email address' do 
    User.create(email: 'example@test.com', password: 'password')
    
    visit '/'
    find('#login').click
    fill_in :email, with: 'wrongexample@test.com'
    fill_in :password, with: 'password'
    click_button 'Login'
    expect(page).to have_content "Please check your email and/or password is correct"
  end

  scenario 'User puts in wrong password' do 
    User.create(email: 'example@test.com', password: 'password')
    
    visit '/'
    find('#login').click
    fill_in :email, with: 'example@test.com'
    fill_in :password, with: 'wrongpassword'
    click_button 'Login'
    expect(page).to have_content "Please check your email and/or password is correct"
  end
end