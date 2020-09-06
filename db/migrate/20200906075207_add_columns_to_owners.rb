class AddColumnsToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :address_1, :string, :limit => 255
    add_column :owners, :address_2, :string, :limit => 255
    add_column :owners, :town, :string, :limit => 50
    add_column :owners, :postcode, :string, :limit => 8
  end
end
