module Accessors

  WRONG_TYPE = "Тип переменной отличается от указанного"

  def self.attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        instance_variable_get("@#{name}_arr") || instance_variable_set("@#{name}_arr", [])
        instance_variable_get("@#{name}_arr") << value
      end

      define_method("#{name}_history".to_sym) { instance_variable_get("@#{name}_arr") }
    end
  end 

  def self.strong_attr_accessor(name, name_class)
    var_name = "@#{name}".to_sym
    define_method(name){ instance_variable_get(var_name) }

    define_method("#{name}=".to_sym) do |value|
      raise WRONG_TYPE unless value.is_a?(name_class)
      instance_variable_set(var_name, value)
    end
    
  end

end
