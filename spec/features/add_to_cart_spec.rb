# require 'rails_helper'

# RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

#   # SETUP
#   before :each do
#     @category = Category.create! name: 'Apparel'

#     10.times do |n|
#       @category.products.create!(
#         name:  Faker::Hipster.sentence(3),
#         description: Faker::Hipster.paragraph(4),
#         image: open_asset('apparel1.jpg'),
#         quantity: 10,
#         price: 64.99
#       )
#     end

#   end

#   scenario "change from MyCart(0) to to MyCart(1)" do
#     visit root_path

#     # commented out b/c it's for debugging only
#     click_on "Add"
#     # expect(page).to have_content('What are you looking for?')
#     expect(page).to have_content('My Cart (1)')
#   end


# end