class UserProfilesController < ApplicationController
  def show
    @user_bucket_lists = current_user.user_bucket_lists
  end

end
