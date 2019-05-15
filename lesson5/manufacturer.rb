module Manufacturer

  def set_manufacturer(title)
    self.manufacturer = title
  end 

  def get_manufacturer
    self.manufacturer
  end

  protected 

  attr_accessor :manufacturer

  # def manufacturer=(title)
  #   @manufacturer = title
  # end 

  # def manufacturer
  #   @manufacturer
  # end

end