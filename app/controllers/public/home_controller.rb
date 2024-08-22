class Public::HomeController < ApplicationController
  def top
    redirect_to menus_path if current_user
  end
  
  
end