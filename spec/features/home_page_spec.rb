# require 'rails_helper'

# RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

#   scenario "They see all products" do
#     # ACT
#     visit root_path

#     # DEBUG / VERIFY
#     save_screenshot
#     expect(page).to have_css 'article.product'
#   end
# end


require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    # save_and_open_screenshot
    

  end

  # scenario "They see all products" do
  #   # ACT
  #   visit root_path

  #   # DEBUG
  #   save_screenshot

  #   # VERIFY
  #   expect(page).to have_css 'article.product'
  # end

  scenario "They see all products" do
    visit root_path

    # commented out b/c it's for debugging only
    save_and_open_screenshot

    expect(page).to have_css 'article.product', count: 10
  end


end