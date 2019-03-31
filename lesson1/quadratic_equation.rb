puts "Введите коэффициент a:"
a = gets.chomp.to_f
puts "Введите коэффициент b:"
b = gets.chomp.to_f
puts "Введите коэффициент c:"
c = gets.chomp.to_f

d = b**2 - 4 * a * c 
puts "d = #{d}"
 
if d > 0
  root = Math.sqrt(d)  
  x1 = (-b + root) / (2.0 * a) 
  x2 = (-b - root) / (2.0 * a) 
  puts "x1 = #{x1}, x2 = #{x2}"
elsif d == 0
  x1 = -b / (2.0 * a)
  puts "x1 = x2 = #{x1}"
elsif d < 0
  puts "Корней нет"
end
