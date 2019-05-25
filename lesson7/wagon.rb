require_relative 'manufacturer'

class Wagon
  include Manufacturer
  
  attr_reader :number, :type

  def to_s
    number.to_s
  end

end
