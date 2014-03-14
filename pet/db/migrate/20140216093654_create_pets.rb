class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :age, precision: 0, scale: 2

      t.timestamps
    end
  end
end
