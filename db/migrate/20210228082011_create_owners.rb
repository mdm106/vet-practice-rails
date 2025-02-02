class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :telephone, :limit => 11
      t.string :email
      t.timestamps
    end
  end
end
