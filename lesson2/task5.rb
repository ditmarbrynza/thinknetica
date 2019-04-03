year = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Ввведи число:"
dd = gets.to_i
puts "Ввведи месяц:"
mm = gets.to_i
puts "Ввведи год:"
yy = gets.to_i

if yy % 4 == 0 && yy % 100 != 0 || yy % 400 == 0
  year[2] = 29
end

sum = 0
i = 1
while i <= mm  do
  if i == mm
    sum += dd
    break
  end 
     
  sum += year[i]
  i += 1
end

puts sum
