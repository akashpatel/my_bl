class BucketListTag < ActiveRecord::Base
  attr_accessible :name

  has_many  :user_bucket_lists

  def self.search (keyword)
    if keyword
      find(:all, :conditions => ['name LIKE ?', "%#{keyword}%"])
    else
      find(:all)
    end
  end

end
