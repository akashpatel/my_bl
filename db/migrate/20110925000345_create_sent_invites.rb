class CreateSentInvites < ActiveRecord::Migration
  def self.up
    create_table :sent_invites do |t|
      t.integer :user_bucket_list_id
      t.integer :bl_partner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sent_invites
  end
end
