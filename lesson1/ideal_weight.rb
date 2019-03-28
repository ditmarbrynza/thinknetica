puts "Введите ваше имя:"
name = gets.chomp.capitalize!
puts "Введите ваш рост:"
height= Integer(gets.chomp)
ideal_weight = height - 110

if(ideal_weight < 0)
    puts "Ваш вес уже оптимальный"
else
    puts "#{name}, ваш идеальный вес #{ideal_weight}."
end