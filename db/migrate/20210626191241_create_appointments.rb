class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :day
      t.string :services
      t.integer :price
      t.integer :length
      t.integer :stylist_id
      t.integer :client_id
      

      t.timestamps
    end
  end
end
