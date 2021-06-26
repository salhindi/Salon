class CreateStylists < ActiveRecord::Migration[6.1]
  def change
    create_table :stylists do |t|
      t.string :name
      t.integer :phone_number
      t.integer :yrs_experience
      t.integer :user_id

      t.timestamps
    end
  end
end
