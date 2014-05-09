module CurrentPet
  extend ActiveSupport::Concern

  def set_pet(pett_id)
    @curr_pet = Pet.find(pett_id)
    session[:curr_pet_id] = @curr_pet.id
  end
  def get_pet
    if session[:curr_pet_id]
      @curr_pet = Pet.find(session[:curr_pet_id])
      return @curr_pet
    end
  end
  def set_pet_nil
    @curr_pet = nil;
    session[:curr_pet_id] = nil
  end
end