class AddTokenAndOriginal < ActiveRecord::Migration
  def change
  	add_column :emails, :token, :string
  	add_column :emails, :original_to, :string
  end
end
