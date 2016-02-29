class User < ActiveRecord::Base

	# Use built-in rails support for password protection
  has_secure_password

  #Relationships
  has_many :posts

  #Validations
  validates_presence_of :name, :email
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"


end
