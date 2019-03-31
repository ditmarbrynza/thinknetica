puts "Введите первую сторону:"
first = gets.chomp.to_f
puts "Введите вторую сторону:"
second = gets.chomp.to_f
puts "Введите третью сторону:"
third = gets.chomp.to_f


cathetus1, cathetus2, hypotenuse = [first, second, third].sort!
right_triangle = cathetus1**2 + cathetus2**2 == hypotenuse**2
isosceles_equilateral = first == second && second == third
isosceles = first == second || first == third || second == third

if right_triangle 
  puts "Треугольник прямоугольный"
else
  puts "Треугольник не прямоугольный"
end 

puts "Треугольник равнобедренный и равносторонний" if isosceles_equilateral
puts "Треугольник равнобедренный" if isosceles
