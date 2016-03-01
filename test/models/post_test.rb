require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test relationships
  should belong_to(:user)

  # test validations
  should validate_presence_of(:title)
  should validate_presence_of(:description)

end
