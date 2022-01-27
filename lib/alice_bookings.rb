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

  # def self.availability_range(space_id:, start_date:, end_date:)
  #   start_date = Date.parse(start_date)
  #   end_date = Date.parse(end_date)
  #   date_array = (start_date...end_date).map { |date| date.strftime("%Y-%m-%d") }
  #   date_array.each do |date|
  #     if Bookings.get_availability(space_id: 2, date: date) == true
  #       # Do something
  #     else
  #       # Do something
  #     end
  #   end
  # end
end


=begin

<% @calendar.each do |date|
  if Bookings.get_availability(space_id: @space.id, date: date) == true %>
    <li><%= date %> - Available, click here to book</li>
  <% else %>
    <li><%= date %> - Unavailable</li>
  <% end
end %>


=end