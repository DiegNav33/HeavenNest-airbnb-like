class AdvertsController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index show new]

  def index
    if params[:query].present?
      query = params[:query]
      @adverts = Advert.where("city ILIKE :query OR state ILIKE :query OR country ILIKE :query", query: "%#{query}%")

    elsif params[:category].present?
      @adverts = Advert.where(category_id: params[:category])

    else
      @adverts = Advert.all

    end
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
