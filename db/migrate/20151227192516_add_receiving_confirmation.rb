class AddReceivingConfirmation < ActiveRecord::Migration
  def change
    add_column :accounts, :is_receiving, :boolean, default: false
  end
end
