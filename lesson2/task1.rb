year = {
  january: 31, 
  february: 28, 
  march: 29, 
  april: 30, 
  may: 31,
  june: 28,
  july: 31,
  august: 30,
  september: 30,
  october: 31,
  november: 29,
  december: 31
}

year.each do |month, days|
  puts month if days == 30
end
