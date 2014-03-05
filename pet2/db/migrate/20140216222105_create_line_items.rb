class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :pet
      t.belongs_to :cart

      t.timestamps
    end
    add_index :line_items, :pet_id
    add_index :line_items, :cart_id
  end
end
