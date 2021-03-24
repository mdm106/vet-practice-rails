class ChangeTelephoneLength < ActiveRecord::Migration[6.0]
  
  def up
    change_column :owners, :telephone, :string, :limit => 14
  end

  def down
    change_column :owners, :telephone, :string, :limit => 11
  end
  
end
