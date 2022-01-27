feature 'View Avaliability' do 
  scenario 'A user can see the avaliability of a specific space' do 
    set_up_fake_bookings
    log_in
    click_button 'View Spaces'
    click_link 'Little Cottage'
    expect(page).to have_content "2022-02-09 - Booked"
    expect(page).to have_content "2022-02-08 - Avaliable"
  end
end