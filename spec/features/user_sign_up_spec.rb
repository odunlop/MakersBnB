feature 'User Sign Up' do
  let(:test_email) { 'simon@san-angeles.com' }
  let(:test_password) { 'TeddyBear' }

  scenario 'new user can fill in form and create account' do
    visit('/')
    fill_in :email, with: test_email
    fill_in :password, with: test_password
    fill_in :password_confirmation, with: test_password
    click_button 'Sign Up'

    expect(page).to have_content "You're now logged in!"
    expect(page).to have_button 'View Spaces'
  end

  scenario 'it also has a link to the login page' do
    visit('/')
    expect(page).to have_link 'Login'  
  end

  scenario 'User puts in non-matching passwords' do
    visit('/') 
    fill_in :email, with: test_email
    fill_in :password, with: test_password
    fill_in :password_confirmation, with: 'wrongpassword'
    click_button 'Sign Up'

    expect(page).not_to have_content "You're now logged in!"
    expect(page).to have_content "Passwords do not match, try again"
  end

end
