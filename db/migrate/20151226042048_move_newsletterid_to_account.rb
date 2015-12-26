class MoveNewsletteridToAccount < ActiveRecord::Migration
  def change
    remove_column :emails, :newsletter_id
    add_column :emails, :account_id, :integer
  end
end
