class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :type_of_animal
      t.date :dob
      t.float :weight
      t.float :height
      t.integer :biteyness, inclusion: 1..5
      t.references :owner
      t.timestamps
    end
  end
end
