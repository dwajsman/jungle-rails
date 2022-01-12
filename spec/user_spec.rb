require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'should validate USER exists in record' do
      @user = User.new(
        f_name: "Bill", 
        l_name: "Gates",
        email: 'bill@microsoft.com',
        password: "123123",
        password_confirmation:  "123123"
        )

      @user.save!

      expect(@user.id).to be_present
    end 


    it 'should not save - if passwords dont match' do
      @user = User.new(
        f_name: "Bill", 
        l_name: "Gates",
        email: 'bill@microsoft.com',
        password: "123123",
        password_confirmation:  "123456"
        )

      @user.save

      expect(@user.id).not_to be_present
      expect(@user.errors.full_messages).to include("Password needs to match")

    end 


    it 'should not save - if NO first name' do
      @user = User.new(
        f_name: nil, 
        l_name: "Gates",
        email: 'bill@microsoft.com',
        password: "123123",
        password_confirmation:  "123123"
        )

      @user.save

      expect(@user).not_to be_present
      expect(@user.errors.full_messages).to include("First Name needed to save User")

    end 

    it 'should not save - if NO last name' do
      @user = User.new(
        f_name: "Bill", 
        l_name: nil,
        email: 'bill@microsoft.com',
        password: "123123",
        password_confirmation:  "123123"
        )

      @user.save

      expect(@user.id).not_to be_present
      expect(@user.errors.full_messages).to include("Last Name needed to save User")

    end 


    it 'should not save - if NO email' do
      @user = User.new(
        f_name: "Bill", 
        l_name: "Gates",
        email: nil,
        password: "123123",
        password_confirmation:  "123123"
        )

      @user.save

      expect(@user.id).not_to be_present
      expect(@user.errors.full_messages).to include("Email needed to save User")

    end 

    it 'should not save - cant repeat emails' do
      @user = User.new(
        f_name: "Bill", 
        l_name: "Gates",
        email: 'bill@microsoft.com',
        password: "123123",
        password_confirmation:  "123123"
        )

      @user.save

      @user_ = User.new(
        f_name: "Bill", 
        l_name: "Gates",
        email: 'BILL@microsoft.com',
        password: "123123",
        password_confirmation:  "123123"
        )
      
      @user_.save
      
      expect(@user_.id).not_to be_present
      expect(@user_.errors.full_messages).to include("Email already in use")
    end 

    it 'should not save - if password too short' do
      @user = User.new(
        f_name: "Bill", 
        l_name: "Gates",
        email: 'bill@microsoft.com',
        password: "12",
        password_confirmation:  "12"
        )

      @user.save

      expect(@user.id).not_to be_present
      expect(@user.errors.full_messages).to include("Password needs to be longer than 5 characters")

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