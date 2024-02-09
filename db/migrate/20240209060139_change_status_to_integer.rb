class ChangeStatusToInteger < ActiveRecord::Migration[7.0]
  def up
    remove_column :bookings, :status
    add_column :bookings, :status, :integer
  end
end
