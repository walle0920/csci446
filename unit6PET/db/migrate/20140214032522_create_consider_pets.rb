class CreateConsiderPets < ActiveRecord::Migration
  def change
    create_table :consider_pets do |t|
      t.references :pet, index: true
      t.belongs_to :consider_cart, index: true

      t.timestamps
    end
  end
end
