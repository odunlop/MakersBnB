require_relative 'web_helpers'

feature 'View Avaliability' do 
  scenario 'A user can see the avaliability of a specific space' do 
    view_cottage
    fill_in :filter_date, with: '2022-01-28'

    expect(page).not_to have_content "Country Manor"
    expect(page).to have_content "Description"
    expect(page).to have_content "2022/02/08\nUnavaliable"
  end

  scenario 'A user can navigate back to all spaces' do
    view_cottage
    click_button 'Back to all spaces'
    expect(page).to have_current_path("/spaces")
  end
end