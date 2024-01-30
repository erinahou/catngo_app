class AddForeignKeysToUsers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :bookings, :users, column: :user_id
    add_foreign_key :cats, :users, column: :user_id
  end
end
