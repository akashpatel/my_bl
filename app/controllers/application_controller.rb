class ApplicationController < ActionController::Base
  protect_from_forgery

  FB_AUTH_TOKEN = "beautiful_lie_token"

  def get_fb_auth_token
    session[FB_AUTH_TOKEN]
  end

  def store_fb_auth_token (token)
    session.store(FB_AUTH_TOKEN, token)
  end

end
