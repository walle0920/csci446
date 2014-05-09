require 'test_helper'

class LinePetTest < ActiveSupport::TestCase
   test "line pets arrtibutes must not be empty" do
     @line_pet = LinePet.new
     assert @line_pet.invalid?
     assert @line_pet.errors[:pet_id].any?

     @line_pet = LinePet.new(pet_id: 1, fostered_id: 1);
     assert @line_pet.valid?

     @line_pet = LinePet.new(fostered_id: 1)
     assert @line_pet.invalid?
     assert @line_pet.errors[:pet_id].any?

     @line_pet = LinePet.new(pet_id: 1)
     assert @line_pet.valid?

   end


end
