puts "Введите основание треугольника base:"
base = gets.chomp.to_f

puts "Введите высоту треугольника height:"
height = gets.chomp.to_f

area = 0.5 * base * height
puts "Площадь треугольника равна 1/2*a*h: #{area}"