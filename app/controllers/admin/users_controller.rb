class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
    if params[:keyword].present?
      @users = @users.where('id LIKE ?', "%#{params[:keyword]}%").or(
               @users.where('name LIKE ?', "%#{params[:keyword]}%")).or(
               @users.where('email LIKE ?', "%#{params[:keyword]}%"))
    end
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
    @reviews = @user.reviews
  end
  
  def destroy
    @user = User.find_by_id(params[:id])
    @user&.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_users_path
  end
end
