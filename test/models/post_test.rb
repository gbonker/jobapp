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

  should allow_value("UX Designer").for(:title)
  should allow_value("Software Developer").for(:title)
  should_not allow_value(nil).for(:title)

  should allow_value("lorem ipsum").for(:description)
  should allow_value("sdjfljsdlkfjskljdflksjdlkfjslkdjfksjdlkfjslkdjfsdjf").for(:description)
  should_not allow_value(nil).for(:description)

end
