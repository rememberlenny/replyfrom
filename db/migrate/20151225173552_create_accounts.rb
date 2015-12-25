class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :slug
      t.string :fowarded_email
      t.text :description

      t.timestamps
    end
  end
end
