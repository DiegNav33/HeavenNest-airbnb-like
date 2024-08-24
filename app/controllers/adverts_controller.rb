class AdvertsController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index show new]

  def index
    @adverts = Advert.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
