# This migration comes from toqui_engine (originally 20170516025956)
class CreateToquiPasswords < ActiveRecord::Migration[5.0]
  def change
    create_table :toqui_passwords do |t|
      t.integer :user_id
      t.text :password_digest

      t.timestamps
    end
  end
end
