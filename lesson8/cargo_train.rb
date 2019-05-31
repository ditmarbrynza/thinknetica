# frozen_string_literal: true

class CargoTrain < Train
  def attachable_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end

  def type
    'Грузовой'
  end
end
