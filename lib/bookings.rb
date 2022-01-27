require_relative 'database_connection'
require 'Date'

class Bookings

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
end
