class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name,         null: false
      t.string :phone_number, null: false
      t.string :description,  null: false

      t.timestamps null: false
    end
  end
end
