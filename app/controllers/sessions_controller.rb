class SessionsController < ApplicationController
require 'omniauth-facebook'
require 'omniauth'

  def new
    redirect_to '/auth/facebook'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to store_path, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_path, :notice => "Signed out!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
