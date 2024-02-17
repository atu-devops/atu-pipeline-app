class AddParkIdToTicketTypes < ActiveRecord::Migration[7.0]
  def change
    add_reference :ticket_types, :park, null: true, foreign_key: true
    add_column :ticket_types, :category, :string
    add_column :ticket_types, :price, :decimal
  end
end
