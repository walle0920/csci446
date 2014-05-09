class CreateFostereds < ActiveRecord::Migration
  def change
    create_table :fostereds do |t|

      t.timestamps
    end
  end
end
