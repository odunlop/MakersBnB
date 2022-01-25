feature 'User Log Out' do
  let(:test_email) { 'simon@san-angeles.com' }
  let(:test_password) { 'TeddyBear' }

  scenario 'user can log in and then log out' do
    encrypted_password = BCrypt::Password.create(test_password)
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec_params("INSERT INTO users (email, password) VALUES($1, $2);", [test_email, encrypted_password])
    
    visit('/sessions/new')
    fill_in :email, with: test_email
    fill_in :password, with: test_password
    click_button 'Log In'
    click_link 'Log Out'
    expect(page).to have_content "Sign Up to MakersBnB"
    
    connection.exec("TRUNCATE users, spaces;")
  end
end