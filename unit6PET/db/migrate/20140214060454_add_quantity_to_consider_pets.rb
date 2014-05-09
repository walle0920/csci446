class AddQuantityToConsiderPets < ActiveRecord::Migration
  def change
    add_column :consider_pets, :quantity, :integer, default: 1
  end
end
