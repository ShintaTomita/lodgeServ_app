class UsersController < ApplicationController
  before_action :forbid_login_user, {only: [:new, :create]}
  before_action :ensure_correct_user, {only: [:show, :edit, :update, :destroy]}

  def index
    @rooms = @current_user.rooms
  end

  def show
    @user =User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.valid?(:step1) && @user.save
      log_in(@user)
      current_user
      flash[:notice] = "ようこそ#{@current_user.name}さん"
      redirect_to "/profile/#{@current_user.id}"
    else
      render root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params_user)
      flash[:notice] = "更新しました"
      redirect_to action: :show
    else
      render "show"
    end
  end

  def destroy
    log_out
    redirect_to "/"
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to "/rooms"
    end
  end
  private
  def params_user
    params.require(:user).permit(:name, :email, :password_digest, :image, :introduce)
  end
end
