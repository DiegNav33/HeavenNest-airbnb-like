# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning up database..."
Category.destroy_all
Amenity.destroy_all
puts "Database cleaned"
# Categories
categories = ['Apartment', 'House', 'Villa', 'Studio', 'Room',
              'Loft', 'Bungalow', 'Chalet', 'Mansion', 'Cottage']

categories.each do |category_name|
  category = Category.new(name: category_name)
  if category.save
    puts "Category '#{category_name}' created successfully."
  else
    puts "Failed to create category '#{category_name}': #{category.errors.full_messages.join(", ")}"
  end
end

# Amenities
amenities = ['Wi-Fi', 'Air Conditioning', 'Heating', 'Pool', 'Parking',
             'Washing Machine', 'Dishwasher', 'Television', 'Hair Dryer', 'Barbecue',
             'Fully Equipped Kitchen', 'Balcony', 'Terrace', 'Jacuzzi', 'Sauna',
             'Dryer', 'Pets Allowed', 'Smoking Allowed', 'Children’s Games',
             'Iron', 'Desk', 'Lounge Chairs', 'Deck Chairs', 'Gym',
             'Library', 'Game Room', 'Housekeeping Service', 'Breakfast',
             'Refrigerator', 'Microwave', 'Oven', 'Toaster', 'Coffee Maker',
             'Kettle', 'Board Games', 'Baby Equipment', 'Dining Table',
             'Sofa Bed', 'Safe', 'Internet Access', 'Telephone', 'Digital Key',
             'Hiking Trails', 'Mountain Views', 'Golf Course Access', 'Skiing Equipment',
             'Beach Access', 'Outdoor Furniture', 'Pet-Friendly', 'On-site Parking',
             'Elevator', 'Hot Tub', 'Smart TV', 'Sound System', 'Bar',
             'Outdoor Dining Area', 'Fireplace', 'Walk-in Closet', 'Shower',
             'Bathtub', 'Dishware', 'Cooking Utensils']

amenities.each do |amenity_name|
  amenity = Amenity.new(name: amenity_name)
  if amenity.save
    puts "Amenity '#{amenity_name}' created successfully."
  else
    puts "Failed to create amenity '#{amenity_name}': #{amenity.errors.full_messages.join(", ")}"
  end
end

puts "Categories and amenities created"
