require 'rails_helper'

RSpec.feature "Visitor navigates to a product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    # 1.times do |n|
      @category.products.create!(
        # name:  Faker::Hipster.sentence(3),
        name:  "Product Name",
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    # end

    # save_and_open_screenshot
    @product = Product.all

  end

  # scenario "They see all products" do
  #   # ACT
  #   visit root_path

  #   # DEBUG
  #   save_screenshot

  #   # VERIFY
  #   expect(page).to have_css 'article.product'
  # end

  scenario "They see product details" do
    visit root_path
    click_on "Product Name"
    find('.product-detail')

    # commented out b/c it's for debugging only
    expect(page).to have_css '.product-detail', count: 1
    
    save_and_open_screenshot
  end


end