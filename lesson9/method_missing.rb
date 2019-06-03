class X 
  def method_missing(name, *args)
    p self.class.send(:define_method, name.to_sym, lambda { | *args | puts args.inspect})
  end
end
