class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @user = User.find(params[:id])
  end
end
