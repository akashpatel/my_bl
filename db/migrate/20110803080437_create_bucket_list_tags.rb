class CreateBucketListTags < ActiveRecord::Migration
  def self.up
    create_table :bucket_list_tags do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :bucket_list_tags
  end
end
