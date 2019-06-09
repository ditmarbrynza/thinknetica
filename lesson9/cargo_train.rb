require_relative 'validation'

class CargoTrain < Train

  include Validation

  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i

  validate :number, :presence 
  validate :number, :format, NUMBER_FORMAT
  validate :number, :type, String

  def attachable_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end

  def type
    'Грузовой'
  end
end
