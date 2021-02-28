require 'test_helper'

class OwnerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "test have we bananas method" do
    owner = Owner.new
    answer = owner.haveWeBananas(0)
    assert_equal("No we have no bananas", answer)
    answer = owner.haveWeBananas(5)
    assert_equal("Yes we have 5 bananas", answer)
  end

end
