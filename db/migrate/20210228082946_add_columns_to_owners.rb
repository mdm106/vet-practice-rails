class AddColumnsToOwners < ActiveRecord::Migration[6.0]
  def change
    change_table :owners do |t|
      t.string :address_1
      t.string :address_2, :null => true
      t.string :town, :limit => 50
      t.string :postcode, :limit => 8
    end
  end
end
