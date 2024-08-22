class Public::ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.build(review_params)
    @shop = @review.shop
    if @review.save
      flash[:notice] = "success"
      redirect_to shop_path(@shop)
    else
      flash.now[:alert] = "failed"
      render "public/shops/show"
    end
  end
  
  def update
    @review = Review.find(params[:id])
    @shop = @review.shop
    if @review.update(update_review_params)
      flash[:notice] = "success"
      redirect_to shop_path(@shop)
    else
      flash.now[:alert] = "failed"
      render "public/shops/show"
    end
  end
  
  private
  
  def review_params
    params.require(:review).permit(:star).merge(shop_id: params[:shop_id])
  end
  
  def update_review_params
    params.require(:review).permit(:star)
  end
end