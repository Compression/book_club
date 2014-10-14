class BooksController < ApplicationController

  def index
    @books = Book.all.order(created_at: :desc)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.includes(:reviews).find(params[:id])
    @review = @book.reviews
  end

  # def edit
  #   @book = Book.authorized_find(current_user, params[:id])
  # end

  # def update
  #   @book = Book.authorized_find(current_user, params[:id])

  #   if @book.update(cat_params)
  #     flash[:notice] = "Book Updated"
  #     redirect_to cat_path
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @book = Book.find(params[:id])

    if @book.destroy
      flash[:notice] = "Book Destroyed"
      redirect_to cats_path
    else
      flash[:alert] = "fael lol, try again wow"
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :year, :category)
  end
end
