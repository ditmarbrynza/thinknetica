# frozen_string_literal: true

module Manufacturer
  def set_manufacturer(title)
    self.manufacturer = title
  end

  def get_manufacturer
    self.manufacturer
  end

  protected

  attr_accessor :manufacturer
end