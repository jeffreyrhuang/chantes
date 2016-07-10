class RestaurantsController < ApplicationController
  rescue_from ActionController::RedirectBackError, with: :redirect_to_default

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Restaurant saved to database"
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
    @photos = @restaurant.photos
  end

  def like
    @restaurant = Restaurant.find(params[:id])
    @restaurant.liked_by current_user
    redirect_to :back
  end

  def dislike
    @restaurant = Restaurant.find(params[:id])
    @restaurant.downvote_from current_user
    redirect_to :back
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :cuisine, :latitude, :longitude)
    end

    def redirect_to_default
      redirect_to root_path
    end

end
