class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @reviews = Review.all
    @reviews = @reviews.where(star: params[:star]) if params[:star].present?
    @reviews = @reviews.where(shop_id: params[:shop_id]) if params[:shop_id].present?
  end
  
  def destroy
    @review = Review.find_by_id(params[:id])
    @review&.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_reviews_path
  end
end
