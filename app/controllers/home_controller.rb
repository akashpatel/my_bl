class HomeController < ApplicationController
  def index
    redirect_to user_profile_path(current_user.user_profile) if current_user
  end

end
