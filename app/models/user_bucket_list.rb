class UserBucketList < ActiveRecord::Base
  attr_accessible :when
  
  belongs_to  :user
  belongs_to  :bucket_list_tag
  
  has_many    :sent_invites
  has_many    :received_invites

  def self.activity_type
    %w[Public Private]
  end

  def self.select_when_to_complete
    %w[Now Later Whenever]
  end  

  def associate_bucket_list_tag (name)
    tag = BucketListTag.find_by_name(name)
    if tag.nil?
      tag = BucketListTag.create(:name => name)
    end

    self.bucket_list_tag = tag
  end


end
