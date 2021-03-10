class CreateTreatments < ActiveRecord::Migration[6.0]
  def change
    create_table :treatments do |t|
      t.string :name
      t.timestamps
    end

    create_join_table :animals, :treatments do |t|
      t.index :animal_id
      t.index :treatment_id
    end

  end
end
