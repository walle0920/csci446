class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :picture
      t.string :breed
      t.decimal :age
      t.decimal :stay
      t.text :description
      t.text :tendencies

      t.timestamps
    end
  end
end
