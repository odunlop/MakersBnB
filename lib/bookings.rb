require_relative 'database_connection'
require 'Date'

class Bookings

  def initialize(id:, space_id:, date:, confirmed:, user_id:)
    @id = id
    @space_id = space_id
    @date = date
    @confirmed = confirmed
    @user_id = user_id
  end

  def self.get_availability(space_id:, date:)
    result = DatabaseConnection.query(
      "SELECT * FROM bookings WHERE space_id = $1 AND date = $2;", [space_id, date]
    )
    return true if result.ntuples.zero?
    false    
  end

  def self.get_spaces(date:)
    result = DatabaseConnection.query(
      "SELECT * FROM spaces WHERE id NOT IN (SELECT spaces.id FROM spaces INNER JOIN bookings ON spaces.id = bookings.space_id WHERE date = $1);", [date]
    )
    result.map do |space|
      Space.new(id: space['id'], name: space['name'], description: space['description'], price: space['price'], creator: space['creator'])
    end
  end

  def self.create(space_id:, date:, confirmed:, user_id:)
    result = DatabaseConnection.query('INSERT INTO bookings (space_id, date, confirmed, user_id) 
    VALUES ($1, $2, $3, $4) RETURNING *;', [space_id, date, confirmed, user_id])
    Bookings.new(result[0]['id'], result[0]['space_id'], result[0]['date'], result[0]['confirmed'], result[0]['user_id'])
  end

  def self.get_bookings(user_id:)
    result = DatabaseConnection.query("SELECT * FROM bookings WHERE user_id = $1", [user_id])
    result.map do |book|
      Bookings.new(
        id: book['id'],
        name: book['space_id'],
        description: book['date'],
        price: book['confirmed'],
        creator: book['user_id'])
    end
  end
end
