class UserProfile < ActiveRecord::Base
  
  attr_accessible :image_path, :first_name, :last_name, :zipcode

  belongs_to  :user

  def full_name
    "#{first_name} #{last_name}"
  end
end
