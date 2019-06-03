# class Test 
#   def initialize 
#     @x = 3
#   end 
# end 

# p nn = Test.new
# nn.instance_eval{ puts @x}

# str = "This some string"
# p str.instance_exec{ puts "self = #{self.methods.include?(:"instance_exec")}"; self.split("s") }

# puts "Enter string"
# str = gets.chomp 
# puts "Enter method"
# method = gets.chomp.to_sym
# puts str.send(method)

