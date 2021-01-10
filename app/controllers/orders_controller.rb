class OrdersController < ApplicationController
  before_action :authenticate_user!


 def index
  @order_address = OrderAddress.new
 end

 def create
  @order = Order.new
  @order_address = OrderAddress.new(address_params)
  if @order_address.valid?
    @order_address.save
    redirect_to root_path
  else
    render :index
  end
 end

 private

 def address_params
 params.require(:order_address).permit(:postal_code,:prefecture_id,:city,:house_number,:building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
 end



end
