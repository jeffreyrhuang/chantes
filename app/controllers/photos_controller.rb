class PhotosController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @photo = @restaurant.photos.build
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @photo = @restaurant.photos.build(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      flash[:success] = 'The photo was uploaded!'
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def destroy

  end

  private

    def photo_params
      params.require(:photo).permit(:image, :caption)
    end
end
