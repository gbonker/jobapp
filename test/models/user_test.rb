require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should have_secure_password

  # test validations
  should validate_presence_of(:name)
  should validate_presence_of(:email)

  should allow_value("Gale").for(:name)
  should allow_value("gbonks wunk").for(:name)
  should allow_value("Gale Virginia Bonker").for(:name)
  should_not allow_value(nil).for(:name)

  should allow_value("gbonker@gmail.com").for(:email)
  should allow_value("gbonker@andrew.cmu.edu").for(:email)
  should allow_value("gbonker@example.com").for(:email)
  should_not allow_value("bad").for(:email)
  should_not allow_value("bad@").for(:email)
  should_not allow_value("bad@example").for(:email)
  should_not allow_value("@bad@example").for(:email)
  should_not allow_value("@bad@example.com").for(:email)
  should_not allow_value(nil).for(:email)

end
