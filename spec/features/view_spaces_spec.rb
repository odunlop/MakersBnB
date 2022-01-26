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
    find('#user_spaces').click
    
    expect(page).to have_content 'Panda Space'
    expect(page).not_to have_content 'Space1'
    expect(page).not_to have_content 'Space2'
  end
end