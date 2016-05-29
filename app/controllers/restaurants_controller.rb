class RestaurantsController < ApplicationController
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
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :location, :cuisine)
    end

end
