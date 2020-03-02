class CreateCards < ActiveRecord::Migration[5.2]
def change
  create_table :cards do |t|
    t.integer :user_id,         foreign_key: true, null: false
    t.integer :customer_id,     null: false
    t.integer :card_number
    t.integer :year,            null: false
    t.integer :month,           null: false
    t.integer :security_number, null: false
    end
  end
end
