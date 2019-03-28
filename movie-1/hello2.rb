puts "как тебя зовут?"
name = gets.chomp

puts "в каком году ты родился?"
year = gets.chomp.to_i

puts "#{name}, привет! Тебе примерно #{2019 - year} лет."
