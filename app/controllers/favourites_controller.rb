class FavouritesController < ApplicationController

  def create
    @advert = Advert.find(params[:advert_id])
    @favourite = current_user.favourites.new(advert_id:@advert.id)
    if @favourite.save
      redirect_back fallback_location: root_path, notice: "Advert successfully added to your favourites list", status: :see_other
    else
      render "adverts/index"
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_back fallback_location: root_path, notice: "Advert successfully removed from your favourites list", status: :see_other
  end
end
