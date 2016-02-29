class User < ActiveRecord::Base

	# Use built-in rails support for password protection
  has_secure_password

  #Relationships
  has_many :posts

  #Validations
  validates_presence_of :name, :email
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"
  validates_presence_of :password, on: :create 
  validates_presence_of :password_confirmation, on: :create 
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true

# login by email address
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

end
