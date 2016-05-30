class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def show

  end

  def edit
    @review = Review.find(params[:id])
    @restaurant = Restaurant.find(@review.restaurant_id)
  end

  def update
    
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.restaurant_id = params[:restaurant_id]
    if @review.save
      flash[:success] = 'Review successfully saved'
      # fix redirect
      redirect_to root_path
    else
      # if form is not valid then app crashes
      render 'new'
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = 'Review successfully deleted'
    redirect_to user_path(current_user)
  end

  private

    def review_params
      params.require(:review).permit(:content, :rating)
    end

end
