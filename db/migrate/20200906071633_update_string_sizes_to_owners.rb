class UpdateStringSizesToOwners < ActiveRecord::Migration[6.0]
  def self.up
    change_column :owners, :first_name, :string,  :limit => 50
    change_column :owners, :last_name, :string,  :limit => 50
    change_column :owners, :telephone, :string,  :limit => 14
  end

  def self.down
    change_column :owners, :first_name, :string
    change_column :owners, :last_name, :string
    change_column :owners, :telephone, :string
  end
end
