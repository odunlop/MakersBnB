require 'alice_bookings'
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
      expect(Bookings.get_availability(space_id: 1, date: '2022-02-08')).to eq false
    end
  end
end
