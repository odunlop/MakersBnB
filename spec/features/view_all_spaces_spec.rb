require_relative 'web_helpers_o'
require 'database_connection'

feature 'View all spaces' do 
  scenario 'View all spaces on MakersBnB' do
    DatabaseConnection.query(
        "INSERT INTO spaces (name, description, price) values ($1, $2, $3);", ['Space1', "The first space", "100"]
      )
      DatabaseConnection.query(
        "INSERT INTO spaces (name, description, price) values ($1, $2, $3);", ['Space2', "The second space", "200"]
      )

    log_in
    click_button 'View Spaces'
    expect(page).to have_content "Space1"
    expect(page).to have_content "Space2"
  end
end