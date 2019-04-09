purchase = {}
loop do
  puts "Введите название товара:"
  product_name = gets.chomp
  break if product_name == "stop"
  puts "Введите цену товара за единицу:"
  product_price = gets.to_f
  puts "Введите количество товара:"
  product_quantity = gets.to_f
  purchase[product_name] = {price: product_price, quantity: product_quantity}
end

#хэш
puts "Хэш: #{purchase}"

#итоговая сумма за каждый товар
sum = 0
purchase.each do |product_name, product_info|
  product_price = product_info[:price] * product_info[:quantity]
  sum += product_price
  puts "#{product_name}: #{product_price}"
end

#итоговая сумма всех покупок "в корзине"
puts "Сумма товаров в корзине: #{sum}"
