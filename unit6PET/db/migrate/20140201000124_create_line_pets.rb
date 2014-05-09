class CreateLinePets < ActiveRecord::Migration
  def change
    create_table :line_pets do |t|
      t.references :pet, index: true
      t.belongs_to :fostered, index: true

      t.timestamps
    end
  end
end
