class AddDefaultValueToUsersRole < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:users, :role, 'vet')
  end
end
