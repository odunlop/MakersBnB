require 'bookings'
require 'setup_test_database'

describe Bookings do
  before(:each) do
    setup_bookings_table
  end

  describe '.get_availability' do
    it 'returns true when a space is available on a given date' do
      expect(Bookings.get_availability(space_id: 2, date: '2022-02-10')).to eq true
    end
    it 'returns false when a space is not available on a given date' do
      expect(Bookings.get_availability(space_id: 2, date: '2022-02-09')).to eq false
    end
    it 'a space is still available on a date if the booking is not yet confirmed' do
      expect(Bookings.get_availability(space_id: 2, date: '2022-02-08')).to eq true
    end
  end

  describe '.get_spaces' do
    it 'lists the spaces available on a particular date' do 
      result = Bookings.get_spaces(date: '2022-02-09')
      expect(result[0].name).to eq 'Little Cottage'
    end
  end

  describe '.create' do
    it 'creates a new booking' do
      test = Bookings.create(
        space_id: '1', 
        date: '2022-02-10', 
        confirmed: 'False', 
        user_id: '2')
      booking = DatabaseConnection.query("SELECT * FROM bookings WHERE date = '2022-02-10';")

      expect(test.id).to eq booking[0]['id']
      expect(booking[0]['date']).to eq '2022-02-10'
      expect(booking[0]['user_id']).to eq '2'
      expect(booking[0]['space_id']).to eq '1'
    end
  end
end