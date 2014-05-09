class AddPetToFosterParents < ActiveRecord::Migration
  def change
    change_table :foster_parents do |t|
      t.references :pet, index: true
    end
  end
  def down
    change_table :foster_parents do |t|
      t.remove :pet_id
    end
  end
end
