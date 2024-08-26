class Shop::ShopsController < ApplicationController
  before_action :authenticate_shop!
  before_action :correct_user
  
  def show
    
  end
  
  def edit
  end
  
  def update
    if @shop.update(shop_params)
      flash[:notice] = "success"
      redirect_to shop_shop_path(@shop)
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end
  
  def destroy
    @shop.destroy
    flash[:notice] = "success"
    redirect_to root_path
  end
  
  public
  
  def shop_params
    params.require(:shop).permit(:name)
  end
  
  def correct_user
    @shop = Shop.find_by_id(params[:id])
    redirect_to shop_root_url unless current_shop == @shop
  end
end