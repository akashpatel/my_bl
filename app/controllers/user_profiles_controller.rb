class UserProfilesController < ApplicationController
  def show
    unless current_user
      redirect_to home_index_path
    else
      @user_bucket_lists = current_user.user_bucket_lists
    end
  end

end
