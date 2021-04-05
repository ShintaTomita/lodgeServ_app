class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@users)
      current_user
      flash[:notice] = "ようこそ#{@current_user.name}さん"
      logged_in?
      redirect_to "/"
    else
      flash[:notice] = "メールアドレス、パスワードが間違っています"
      render "sessions/new"
    end
  end

  def destroy
    log_out
    redirect_to "/"
  end
end
