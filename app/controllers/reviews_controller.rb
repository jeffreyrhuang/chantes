class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def show

  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = 'Review successfully saved'
      # fix redirect
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def review_params
      params.require(:review).permit(:comment, :rating)
    end

end
