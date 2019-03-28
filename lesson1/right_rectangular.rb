puts "Введите первую сторону:"
first = Integer(gets.chomp)
puts "Введите вторую сторону:"
second = Integer(gets.chomp)
puts "Введите третью сторону:"
third = Integer(gets.chomp)


a = 0
b = 0
c = 0

if(first > second && first > third)
    c = first
    a = second 
    b = third
elsif (second > first && second > third)
    c = second
    a = first 
    b = third
elsif (third > first && third > second)
    c = third
    a = first 
    b = second
end

if( (a*a) + (b*b)  == c*c)
    puts "Треугольник прямоугольный"
    if ( (a == b) || (a == c) || (b == c) )
        puts "и равнобедренный"
    end 
elsif ((a == b) == c)
    puts "Треугольник равнобедренный и равносторонний, но не прямоугольный"
end