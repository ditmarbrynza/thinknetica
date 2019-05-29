# frozen_string_literal: true

class CargoWagon < Wagon
  def initialize(number, volume)
    super(number, volume)
    @type = 'Грузовой'
  end
end
