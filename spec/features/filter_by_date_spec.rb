require_relative 'web_helpers'

feature 'Filter by date' do
  scenario 'user can select date and see spaces available' do
    set_up_fake_bookings
    log_in
    click_button 'View Spaces'
    fill_in :filter_date, with: '2022-02-09'
    click_button 'Get Availability'
    expect(page).to have_content 'City apartment'
    expect(page).not_to have_content 'Country manor'
  end
end