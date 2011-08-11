class CreateUserBucketLists < ActiveRecord::Migration
  def self.up
    create_table :user_bucket_lists do |t|
      t.string   :when_to_complete
      t.integer  :user_id
      t.integer  :bucket_list_tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_bucket_lists
  end
end
