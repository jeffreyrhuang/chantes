class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.restaurant_id = params[:restaurant_id]
    if @review.save
      flash[:success] = 'Review successfully saved'
      # fix redirect
      redirect_to root_path
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
      render 'new'
    end
  end

  def show

  end

  def edit
    @review = Review.find(params[:id])
    @restaurant = Restaurant.find(@review.restaurant_id)
  end

  def update
    @review = Review.find(params[:id])
    @restaurant = Restaurant.find(@review.restaurant_id)
    if @review.update(review_params)
      flash[:success] = "Review was successfully edited"
      redirect_to user_path(current_user)
    else
      render 'edit'
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
