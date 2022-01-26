feature 'Log out ' do
  let(:test_email) { 'simon@san-angeles.com' }
  let(:test_password) { 'TeddyBear' }

  scenario 'user can logout' do
    visit('/')
    fill_in :email, with: test_email
    fill_in :password, with: test_password
    fill_in :password_confirmation, with: test_password
    click_button 'Sign Up'
    click_button 'Sign Out'

    expect(page).to have_content "You have signed out"  
  end
end