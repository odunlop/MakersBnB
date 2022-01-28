require 'calendar'
require 'date'

describe Calendar do 

  it 'can list the next 7 days' do 
    date = Date.new(2022, 1, 27)
    test_date = Date.parse('2022-01-27')
    test = Calendar.new(test_date)
    expect(test.generate(7)).to eq ["2022/01/27", "2022/01/28", "2022/01/29", "2022/01/30", "2022/01/31", "2022/02/01", "2022/02/02"]
  end

  it 'if no date is provided, today is used automatically' do 
    today = Time.now.strftime("%Y/%m/%d")
    result = Calendar.new.generate(1)
    expect(result.first).to eq today
  end
end