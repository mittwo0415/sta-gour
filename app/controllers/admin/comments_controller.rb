class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @comments = Comment.all
    if params[:keyword].present?
      @comments = @comments.where('id LIKE ?', "%#{params[:keyword]}%").or(
               @comments.where('content LIKE ?', "%#{params[:keyword]}%"))
    end
  end
  
  def destroy
    @comment = Comment.find_by_id(params[:id])
    @comment&.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_comments_path
  end
end
