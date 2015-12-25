class CreateAcccounts < ActiveRecord::Migration
  def change
    create_table :acccounts do |t|
      t.integer :user_id
      t.string :slug
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
