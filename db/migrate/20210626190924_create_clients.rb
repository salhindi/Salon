class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :phone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
