feature 'User Log In' do
  let(:test_email) { 'simon@san-angeles.com' }
  let(:test_password) { 'TeddyBear' }

  scenario 'existing user can log in and view spaces' do
    encrypted_password = BCrypt::Password.create(test_password)
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec_params("INSERT INTO users (email, password) VALUES($1, $2);", [test_email, encrypted_password])
    
    visit('/sessions/new')
    fill_in :email, with: test_email
    fill_in :password, with: test_password
    click_button 'Log In'
    expect(page).to have_content "You are logged in as #{test_email}"
    expect(page).to have_link 'Log Out'  
    
    connection.exec("TRUNCATE users, spaces;")
  end

  scenario 'entering wrong credentials returns a message' do
    visit('/sessions/new')
    fill_in :email, with: test_email
    fill_in :password, with: test_password
    click_button 'Log In'
    expect(page).to have_content "Incorrect email or password"
  end

end
