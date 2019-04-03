fib = []
fib.push(0)
fib.push(1)

for i in 2..100
  fib[i] = fib[i-1] + fib[i-2]
end 

puts "#{fib}"