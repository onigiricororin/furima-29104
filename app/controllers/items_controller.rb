class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :find_params_id, only: [:show,:destroy]

  def index 
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:summary,:price,:category_id,:condition_id,:burden_id,:prefecture_id,:days_to_ship_id).merge(user_id: current_user.id)
  end

  def find_params_id
    @item = Item.find(params[:id])
  end

end
