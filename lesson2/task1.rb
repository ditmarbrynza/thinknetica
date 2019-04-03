year = {
  "January" => 31, 
  "February" => 28, 
  "March" => 29, 
  "April" => 30, 
  "May" => 31,
  "June" => 28,
  "July" => 31,
  "August" => 30,
  "September" => 30,
  "October" => 31,
  "November" => 29,
  "December" => 31
}

year.each do |key, value|
  if value == 30
    puts "#{key}"
  end
end