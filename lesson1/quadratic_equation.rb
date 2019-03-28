puts "Введите коэффициент a:"
a = Integer(gets.chomp)
puts "Введите коэффициент b:"
b = Integer(gets.chomp)
puts "Введите коэффициент c:"
c = Integer(gets.chomp)

d = b**2-4*a*c 

if (d > 0)
    x1 = (-b + Math.sqrt(d))/(2*a) 
    x2 = (-b - Math.sqrt(d))/(2*a) 
    puts "x1 = #{x1}, x2 = #{x2}"
elsif (d == 0)
    x1 = -b/(2*a)
    puts "x1 = x2 = #{x1}"
elsif(d < 0)
    puts "Корней нет"
end