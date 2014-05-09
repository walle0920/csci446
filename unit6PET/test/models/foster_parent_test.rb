require 'test_helper'

class FosterParentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #validates :name, :address, :email, presence: true
  test "foster parent arrtibutes must not be empty" do
    @foster_parent = FosterParent.new
    assert @foster_parent.invalid?
    assert @foster_parent.errors[:name].any?
    assert @foster_parent.errors[:address].any?
    assert @foster_parent.errors[:email].any?

    @foster_parent = FosterParent.new(name: "joe bob", address: "1500 araphoe st", email: "cust@example.com");
    assert @foster_parent.valid?
    end

end
