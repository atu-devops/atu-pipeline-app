class CreateParks < ActiveRecord::Migration[7.0]
  def change
    create_table :parks do |t|
      t.string :park_name
      t.text :description
      t.integer :capacity
      t.boolean :availability

      t.timestamps
    end
  end
end
