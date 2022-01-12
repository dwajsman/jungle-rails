require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'should validate product exists in record' do
      @category = Category.new(name: 'MyCategory')
      @product = Product.new(name: "calendar", price_cents: 25, quantity: 33, category: @category)
      @product.save

      expect(@product.id).to be_present
    end 


    it 'should not save - NO name NO product save' do
      @category = Category.new(name: 'MyCategory')
      @product = Product.new(name: nil, price_cents: 25, quantity: 33, category: @category)
      @product.save

      expect(@product.name).not_to be_present
    end 

    it 'should not save - NO price NO product save' do
      @category = Category.new(name: 'MyCategory')
      @product = Product.new(name: 'Calendar', price_cents: nil, quantity: 33, category: @category)
      @product.save

      expect(@product).not_to be_valid
    end 

    it 'should not save - NO quantity NO product save' do
      @category = Category.new(name: 'MyCategory')
      @product = Product.new(name: 'Calendar', price_cents: 25, quantity: nil, category: @category)
      @product.save

      expect(@product.quantity).not_to be_present
    end 

    it 'should not save - NO category NO product save' do
      # @category = Category.new(name: 'MyCategory')
      @product = Product.new(name: 'Calendar', price_cents: 25, quantity: 33, category: nil)
      @product.save

      expect(@product.category).not_to be_present
    end 





  end
end



# validates :name, presence: true 
# validates :price, presence: true 
# validates :quantity, presence: true 
# validates :category, presence: true 


# name: 'Calendar',
# price: 25,
# quantity: 33,
# category: 1