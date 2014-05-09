class ConsiderCart < ActiveRecord::Base
  #items in the cart are pets. destroys all consider pets with association
  has_many :consider_pets, dependent: :destroy

  #helper method to determine which pet was currently added to be considered.
  def add_pet(pet_id)
    current_pet = consider_pets.find_by(pet_id: pet_id)

    if current_pet.nil?
      current_pet = consider_pets.build(pet_id: pet_id)
    end
    current_pet
  end
end
