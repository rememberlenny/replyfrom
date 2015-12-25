class CreateAccounts < ActiveRecord::Migration
  def change
    drop_table :acccounts
    create_table :accounts do |t|
      t.integer :user_id
      t.string :slug
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
