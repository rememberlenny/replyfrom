class SetupAVerifiedAction < ActiveRecord::Migration
  def change
    add_column :accounts, :is_verified, :boolean, default: false
  end
end
