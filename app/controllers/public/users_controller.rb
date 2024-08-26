class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def guest_login
    @user = User.find_or_initialize_by(email: "guest_user@test.com")
    @user.name = "ゲスト"
    @user.password = SecureRandom.hex(10)
    @user.save
    sign_in(@user)
    redirect_to root_path
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:notice] = "success"
      redirect_to root_path
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:notice] = "success"
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name)
  end
  
  def correct_user
    @user = User.find_by_id(params[:id])
    redirect_to root_url unless current_user == @user
  end
end