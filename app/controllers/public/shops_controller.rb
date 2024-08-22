class Public::ShopsController < ApplicationController
  def index
    @shops = Shop.all
    @shops = @shops.where('name LIKE ?', "%#{params[:keyword]}%") if params[:keyword].present?
    @shops = @shops.where(ball_park_id: params[:ball_park_id]) if params[:ball_park_id].present?
  end
  
  def show
    @shop = Shop.find(params[:id])
    @review = current_user.reviews.find_or_initialize_by(shop_id: @shop.id)
  end
end