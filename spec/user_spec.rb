require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it '1 should validate USER exists in record' do
      @user = User.new(
        f_name: "Bill", 
        l_name: "Gates",
        email: 'bill@microsoft.com',
        password: "123123",
        password_confirmation:  "123123"
        )

      @user.save!

      expect(@user).to be_valid
    end 


    it '2 should not save - if passwords dont match' do
      @user = User.new(
        f_name: "Bill", 
        l_name: "Gates",
        email: 'bill@microsoft.com',
        password: "123123",
        password_confirmation:  "123456"
        )

      @user.save

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end 


    it '3 should not save - if NO first name' do
      @user = User.new(
        f_name: nil, 
        l_name: "Gates",
        email: 'bill@microsoft.com',
        password: "123123",
        password_confirmation:  "123123"
        )

      @user.save

      expect(@user).not_to be_valid
      # expect(@user.errors.full_messages).to include("First Name needed to save User")

    end 

    it '4 should not save - if NO last name' do
      @user = User.new(
        f_name: "Bill", 
        l_name: nil,
        email: 'bill@microsoft.com',
        password: "123123",
        password_confirmation:  "123123"
        )

      @user.save

      expect(@user).not_to be_valid
      # expect(@user.errors.full_messages).to include("Last Name needed to save User")

    end 


    it '5 should not save - if NO email' do
      @user = User.new(
        f_name: "Bill", 
        l_name: "Gates",
        email: nil,
        password: "123123",
        password_confirmation:  "123123"
        )

      @user.save

      expect(@user).not_to be_valid
      # expect(@user.errors.full_messages).to include("Email needed to save User")

    end 

    it '6 should not save - cant repeat emails' do
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
      
      expect(@user_).not_to be_valid
      # expect(@user_.errors.full_messages).to include("Email already in use")
    end 

    it '7 should not save - if password too short' do
      @user = User.new(
        f_name: "Bill", 
        l_name: "Gates",
        email: 'bill@microsoft.com',
        password: "12",
        password_confirmation:  "12"
        )

      @user.save

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")

    end 

  end

  describe 'authenticate_with_credentials' do
    it '8 should authenticate with CORRECT credentials' do
      @user = User.new(
        f_name: "Bill", 
        l_name: "Gates",
        email: 'bill@microsoft.com',
        password: "123456",
        password_confirmation:  "123456"
        )
      @user.save

      user = User.authenticate_with_credentials('bill@microsoft.com', '123456')
      expect(user).to eq(@user)

    end 
  end


    it '9 should NOT authenticate with WRONG credentials' do
      @user = User.new(
        f_name: "Bill", 
        l_name: "Gates",
        email: 'bill@microsoft.com',
        password: "123456",
        password_confirmation:  "123456"
        )
      @user.save

      user = User.authenticate_with_credentials('bill@microsoft.com', 'password')
      expect(user).to_not eq(@user)

    end


# if user = User.authenticate_with_credentials(params[:email], params[:password])
#       # success logic, log them in

#     else
#       # failure, render login form

#     end



end







# validates :name, presence: true 
# validates :price, presence: true 
# validates :quantity, presence: true 
# validates :category, presence: true 


# name: 'Calendar',
# price: 25,
# quantity: 33,
# category: 1