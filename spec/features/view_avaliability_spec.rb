require_relative 'web_helpers'

feature 'View Avaliability' do 
  scenario 'A user can see the avaliability of a specific space' do 
    set_up_fake_bookings
    log_in
    click_button 'View Spaces'
    click_link 'Country Manor'
    expect(page).not_to have_content "Little Cottage"
    expect(page).to have_content "Description"
    expect(page).to have_content "2022/02/09\nUnavaliable"
  end
end