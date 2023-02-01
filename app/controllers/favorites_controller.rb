class FavoritesController < ApplicationController
  before_action :authenticate_user
  def create
    @favorite = Favorite.new(user_id: @current_user.id, record_id: params[:record_id])
    @favorite.save
    redirect_to "/records/#{params[:record_id]}"
  end

  def destroy
    @favorite = Favorite.find_by(user_id: @current_user.id, record_id: params[:record_id])
    @favorite.destroy
    redirect_to "/records/#{params[:record_id]}"
  end
end