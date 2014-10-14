class ReviewsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book = @book

    if @review.save
      redirect_to book_path(@book)
    else
      flash[:alert] = "fael review lol, try again wow"
      render "books/show"
    end
  end

  def new
    @review = Review.new
    @book = Book.find(params[:book_id])
  end

  def show
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:notice] = "Review updated"
      redirect_to book_path(@review.book)
    else
      flash[:alert] = "fael lol, try again wow"
      render 'edit'
    end
  end

  # def destroy
  #   @review = Review.authorized_find(current_user, params[:id])

  #   if @review.destroy
  #     flash[:notice] = "Deleted review"
  #     redirect_to book_path(@review.book)
  #   else
  #     flash[:alert] = "fael lol, try again wow"
  #     redirect_to book_path(@review.book)
  #   end
  # end
  # need to make an admin edit page


  private

  def review_params
    params.require(:review).permit(:review, :rating)
  end
end
