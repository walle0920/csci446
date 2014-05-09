class AddStatusToPets < ActiveRecord::Migration
  def change
    add_column :pets, :status, :string
  end
end
