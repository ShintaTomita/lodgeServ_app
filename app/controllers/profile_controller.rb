class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def destroy
    log_out
    redirect_to "/"
  end
end
