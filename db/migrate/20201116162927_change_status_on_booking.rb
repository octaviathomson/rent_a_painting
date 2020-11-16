class ChangeStatusOnBooking < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :status
    add_column :bookings, :status,:string,default: "pending"
  end
end
