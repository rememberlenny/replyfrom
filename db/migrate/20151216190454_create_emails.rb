class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :newsletter_id
      t.text :to
      t.text :from
      t.text :subject
      t.text :body
      t.text :raw_text
      t.text :raw_html
      t.text :raw_body
      t.text :headers
      t.text :raw_headers
      t.boolean :admin_email
      t.string :slug
      t.text :origin_body
      t.text :origin_raw_html

      t.timestamps
    end
  end
end
