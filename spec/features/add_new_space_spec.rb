require_relative 'web_helpers'

feature 'Add new space' do 
  scenario 'User adds a new space' do 
    log_in
    list_panda_space

    expect(page).to have_content 'Panda Space'
  end
end