require 'date'

class Calendar
  def initialize(date = Date.new(Time.now.year, Time.now.month, Time.now.day))
    @date = date
    @calendar = []
  end

  def generate(num)
    counter = 0
    num.times do
      @calendar << (@date + counter).strftime("%Y/%m/%d")
      counter += 1
    end
    return @calendar
  end
end