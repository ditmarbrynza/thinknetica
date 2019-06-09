module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def validate(name, type, *params)
      @validations ||= []
      @validations << {name: name, type: type, params: params}
    end

    def validations
      @validations
    end

  end

  module InstanceMethods
    
    def validate!
      self.class.validations.each do |validation|
        value = instance_variable_get("@#{validation[:name]}")
        method_name = "validate_#{validation[:type]}"
        send(method_name, value, *validation[:params])
      end
    end 

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    private 
    
    def validate_presence(value)
      raise "Значение атрибута является пустой строкой" if value == "" || value.nil? 
    end 

    def validate_format(value, format)
      raise "Значение атрибута не соответствует формату #{format}" if value !~ format
    end 

    def validate_type(value, type)
      raise "Значение атрибута не соответствует классу #{type}" unless value.is_a?(type)
      puts type
    end

  end
end