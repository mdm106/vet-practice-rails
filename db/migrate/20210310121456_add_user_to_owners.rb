class AddUserToOwners < ActiveRecord::Migration[6.0]
  def change
    add_reference :owners, :user, foreign_key: true
  end
end
