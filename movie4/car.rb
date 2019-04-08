class Car
  attr_accessor :color
  attr_reader :drivers
  attr_reader :number

  def initialize(number)
    @number = number
    @color = 'white'
    @drivers = []
  end

  def beep
    puts 'beep beep'
  end
  
  def add_driver(driver)
    @drivers << driver
  end

  def show_drivers
    @drivers.each { |driver| puts driver.name }
  end

end