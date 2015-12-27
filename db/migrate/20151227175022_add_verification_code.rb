class AddVerificationCode < ActiveRecord::Migration
  def change
    add_column :accounts, :verification_code, :string
  end
end
