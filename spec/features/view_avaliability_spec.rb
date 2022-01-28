require_relative 'web_helpers'

feature 'View Avaliability' do 
  scenario 'A user can see the avaliability of a specific space' do 
    set_up_fake_bookings
    log_in
    click_button 'View Spaces'
    click_link 'Little Cottage'
    expect(page).not_to have_content "Country Manor"
    expect(page).to have_content "Description"
    expect(page).to have_content "2022/02/08\nUnavaliable"
  end
end