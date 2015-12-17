class AddUserToPromp < ActiveRecord::Migration
  def change
    add_column :prompts, :user_id, :integer
  end
end
