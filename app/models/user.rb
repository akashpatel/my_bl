class User < ActiveRecord::Base
  has_many  :authentications
  has_one   :user_profile
  has_many  :user_bucket_lists
  has_many  :bucket_list_tags,  :through => :user_bucket_lists


  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me



  def apply_omniauth(omniauth)
    self.email = omniauth['user_info']['email'] if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def create_profile(omniauth)
    #persist user's facebook data that was retrieved via omniauth
    fb_user_info = omniauth["user_info"]
    self.user_profile = UserProfile.new(:image_path => fb_user_info["image"], :first_name => fb_user_info["first_name"], :last_name => fb_user_info["last_name"])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

end
