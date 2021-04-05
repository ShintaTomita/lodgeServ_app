class ApplicationController < ActionController::Base
  before_action :current_user
  include SessionsHelper

  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to "/rooms"
    end
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

 
end
