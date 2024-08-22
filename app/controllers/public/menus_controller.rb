class Public::MenusController < ApplicationController
  def index
    @menus = Menu.all
    render "shop/menus/index"
  end

  def show
    @menu = Menu.find(params[:id])
    @comment = Comment.new
    render "shop/menus/show"
  end
end