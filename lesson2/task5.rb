year = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Ввведи число:"
dd = gets.to_i
puts "Ввведи месяц:"
mm = gets.to_i
puts "Ввведи год:"
yy = gets.to_i

if yy % 4 == 0 && yy % 100 != 0 || yy % 400 == 0
  year[1] = 29
end

sum = dd + year.take(mm - 1).reduce(0, :+)
# puts "xx #{year.take(mm - 1)}"
# puts year.take(mm - 1).reduce(0, :+)
puts sum
