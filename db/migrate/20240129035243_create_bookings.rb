class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :cat_id
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
