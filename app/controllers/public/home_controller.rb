class Public::HomeController < ApplicationController
  def top
    redirect_to shops_path if current_user
  end
  
  
end