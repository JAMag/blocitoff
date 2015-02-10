require 'faker'

50.times do
  List.create!(
  list: Faker::lorem.sentence
  )
end
lists = List.all

100.times do
  Item.create!(
    item: items.sample
  )
end

puts "Seed finished"
puts "#{List.count} lists created."
puts "#{Item.count} items created."