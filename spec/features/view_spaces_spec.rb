require_relative 'web_helpers'
# require 'database_connection'
require 'space'

feature 'View spaces' do 
  scenario 'View all spaces on MakersBnB' do
    misc_spaces

    log_in
    click_button 'View Spaces'
    expect(page).to have_content "Space1"
    expect(page).to have_content "Space2"
  end

  scenario 'View all my spaces' do 
    misc_spaces
    log_in
    list_panda_space
    click_link('My Spaces')
    
    expect(page).to have_content 'Panda space'
    expect(page).not_to have_content 'Space1'
    expect(page).not_to have_content 'Space2'
  end

  scenario 'User can view avaliability of a specific day' do 
    set_up_fake_bookings
    log_in
    click_button 'View Spaces'
    fill_in :filter_date, with: '2022/02/09'
    click_button 'Get Availability'

    expect(page).not_to have_content 'Country Manor'
    expect(page).to have_content 'Little cottage'
    expect(page).to have_content 'City apartment'
  end
end