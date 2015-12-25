class AddCurrentAccount < ActiveRecord::Migration
  def change
    add_column :users, :current_account_id, :integer, default: false
  end
end
