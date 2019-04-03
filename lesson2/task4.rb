vowels = ['a','e','i','o','u', 'y']
vowels_hash = {}

i = 0

('a'..'z').each.with_index(1) do |letter, index|
  if letter == vowels[i]
    i += 1
    vowels_hash[letter] = index
  end 
end 
puts vowels_hash

