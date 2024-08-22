class Shop::MenusController < ApplicationController
  before_action :authenticate_shop!
  
  def new
    @menu = Menu.new  
  end
  
  def create
    @menu = current_shop.menus.build(menu_params)
    if @menu.save
      flash[:notice] = "success"
      redirect_to shop_menus_path
    else
      flash.now[:alert] = "failed"
      render :new
    end
  end

  def index
     @menus = current_shop.menus
  end

  def show
    @menu = Menu.find(params[:id])  
  end

  def edit
    @menu = Menu.find(params[:id])
  end
  
  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      flash[:notice] = "succes"
      redirect_to shop_menu_path(@menu)
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end
  
  def destroy
    menu = Menu.find(params[:id]) 
    menu.destroy
    redirect_to shop_menus_path
  end
  
  private
  def menu_params
    params.require(:menu).permit(:name, :price, :category, :comment, :image)
  end
end
