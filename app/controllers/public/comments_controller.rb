class Public::CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @menu = @comment.menu
    if @comment.save
      flash[:notice] = "success"
      redirect_to @menu
    else
      flash.now[:alert] = "failed"
      render "shop/menus/show"
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content).merge(menu_id: params[:menu_id])
  end
end