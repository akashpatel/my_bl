class UserBucketList < ActiveRecord::Base
  attr_accessible :when_to_complete, :name
  
  belongs_to  :user

  protected

  def self.select_when_to_complete
    %w[Now Later Whenever]
  end

end
