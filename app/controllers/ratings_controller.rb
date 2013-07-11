class RatingsController < ApplicationController
  def create
    Rating.create!(post_id: params[:post_id], value: params[:rating][:value])
    redirect_to root_path
  end
end
