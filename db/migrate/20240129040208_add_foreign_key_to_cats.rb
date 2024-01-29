class AddForeignKeyToCats < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :bookings, :cats, column: :cat_id
  end
end
