class ReviewsController < ApplicationController

  def create
    @advert = Advert.find(params[:advert_id])
    @review = @advert.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to advert_path(@advert), notice: "Review added successfully.", status: :see_other
    else
      render 'adverts/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @advert = @review.advert_id
    @review.destroy
    redirect_to advert_path(@advert), notice: "Review successfully deleted", status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
