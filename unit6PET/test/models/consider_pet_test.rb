require 'test_helper'

class ConsiderPetTest < ActiveSupport::TestCase
  test "Consider pets arrtibutes must not be empty" do
     @Consider_pet = ConsiderPet.new(pet_id: 1)
     assert @Consider_pet.valid?
  end
end
