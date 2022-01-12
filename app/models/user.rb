class User < ActiveRecord::Base

  has_secure_password

  validates :f_name,  presence: true
  validates :l_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5 }, presence: true

  # validates_confirmation_of :password
  # attr_accessible :password_confirmation
  # attr_accessor :password
  # validates :password, confirmation: true
  # https://stackoverflow.com/questions/14594580/how-to-validate-password-with-confirm-password-rails-3-2/21473166

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end  
  end

  # validates :password_confirmation equal :password
end