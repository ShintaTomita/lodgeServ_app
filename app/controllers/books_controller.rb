class BooksController < ApplicationController
before_action :authenticate_user


  def index
      @books = @current_user.books.order(check_in: "DESC")
  end

  def show
    @book = Book.find(params[:id])
    room_params
  end

  def new
    @room = Room.find(params[:id])
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @room = Room.find_by(id: @book.room_id)
    if @book.save
      flash[:notice] ="ありがとうございます。ご予約を確定致しました。"
      redirect_to "/books/#{@book.id}"
    else
      render "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
    room_params
  end

  def update
    @book = Book.find(params[:id])
    room_params
    if @book.update(books_params)
      flash[:notice] = "ご予約を変更致しました"
      redirect_to action: :show
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.check_in == Date.today
      flash[:notice] = "当日のキャンセルは大変申し訳ありませんが出来ません。"
      redirect_to action: :show
    else
      @book.destroy
      flash[:notice] = "ご予約をキャンセル致しました"
      redirect_to "/"
    end
  end

  private
  def books_params
    params.require(:book).permit(:check_in, :check_out, :customers, :total_price, :user_id, :room_id)
  end

  def room_params
    @room = Room.find_by(id: @book.room_id)
  end

end
