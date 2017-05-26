# This migration comes from toqui_engine (originally 20170516034540)
class CreateToquiSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :toqui_sessions do |t|
      t.integer :user_id
      t.text :access_token

      t.timestamps
    end
  end
end
