require 'test_helper'

class PetTest < ActiveSupport::TestCase
test "pet age must be positive" do
pet = Pet.new(title: "My pet Title",
description: "yyy",
image_url: "zzz.jpg")
pet.age = -1
assert pet.invalid?
assert_equal ["must be greater than or equal to 1"],
pet.errors[:age]
pet.age = 0
assert pet.invalid?
assert_equal ["must be greater than or equal to 1"],
pet.errors[:age]
pet.age = 1
assert pet.valid?
end
end
