class AuthenticationsController < ApplicationController

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in(:user, authentication.user)
    else
      user = User.new
      user.apply_omniauth(omniauth)
      user.create_profile(omniauth)
      if user.save
        flash[:notice] = "Signed in successfully."
        sign_in(:user, user)
      end
    end
    redirect_to user_profile_path(current_user.user_profile)
  end

#  Not used at the moment.
#  def destroy
#    @authentication = Authentication.find(params[:id])
#    @authentication.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(authentications_url) }
#      format.xml  { head :ok }
#    end
#  end
end
