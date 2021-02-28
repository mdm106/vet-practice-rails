class ChangeTelephoneLength < ActiveRecord::Migration[6.0]
  
  def change
    change_column(:owners, :telephone, :string, limit: 14)
  end
  
end
