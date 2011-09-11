class BucketListTag < ActiveRecord::Base
  attr_accessible :name

  has_many  :user_bucket_lists
  has_many  :users,   :through => :user_bucket_lists

  def self.search (keyword)
    if keyword
      find(:all, :conditions => ['name LIKE ?', "%#{keyword}%"])
    else
      find(:all)
    end
  end

  def self.find_matching_users (bl_name)
    bl = BucketListTag.where("name LIKE '%#{bl_name}%'").first
    bl.nil? ? [] : bl.users
  end

end
