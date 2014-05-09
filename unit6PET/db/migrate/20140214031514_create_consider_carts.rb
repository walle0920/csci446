class CreateConsiderCarts < ActiveRecord::Migration
  def change
    create_table :consider_carts do |t|

      t.timestamps
    end
  end
end
