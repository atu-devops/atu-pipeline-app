class CreateAttractions < ActiveRecord::Migration[7.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :description
      t.references :park, null: false, foreign_key: true
      t.boolean :availability
      t.integer :age_limit
      t.integer :height_limit

      t.timestamps
    end
  end
end
