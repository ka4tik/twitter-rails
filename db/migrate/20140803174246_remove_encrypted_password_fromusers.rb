class RemoveEncryptedPasswordFromusers < ActiveRecord::Migration
  def change
    remove_column :users, :encrypted_password
  end
end