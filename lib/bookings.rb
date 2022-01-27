require_relative 'database_connection'
require 'Date'

class Bookings

  def self.get_availability(space_id:, date:)
    check = DatabaseConnection.query(
      "SELECT * FROM bookings WHERE space_id = $1 AND date = $2;", [space_id, date]
    )
    return true if check.ntuples.zero?
    false    
  end

 
end
