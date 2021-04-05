class RoomsController < ApplicationController
  before_action :authenticate_user, only: [:new, :update, :create, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :desroy]
  def search
    @rooms = Room.search(params[:address],params[:search])
  end

  def show
    if @current_user == nil
      flash[:notice] = "ログインもしくは新規登録をしてください"
      redirect_to "/login"
    else
      @room = Room.find(params[:id])
      @user = User.find_by(id: @room.user_id)
    end


  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(posts_params)
    if @room.save
      flash[:notice] = "ルームを新しく登録しました"
      redirect_to "/rooms"
    else
      render "rooms/new"
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(posts_params)
      flash[:notice] = "ルーム情報を更新しました"
      redirect_to action: :index
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      flash[:notice] = "ルームを削除しました"
      redirect_to "/"
    end
  end

  def ensure_correct_user
    @room = Room.find(params[:id])
    if @room.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to "/rooms"
    end
  end

  private
    def posts_params
      params.require(:room).permit(:name, :introduce, :price, :address, :image, :user_id).merge(user_id: @current_user.id)
    end








end
