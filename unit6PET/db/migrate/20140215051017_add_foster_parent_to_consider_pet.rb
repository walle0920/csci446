class AddFosterParentToConsiderPet < ActiveRecord::Migration
  def change
    add_reference :consider_pets, :foster_parent, index: true
  end
end
