class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find

 def index
  @order_address = OrderAddress.new
 end

 def create
  @order_address = OrderAddress.new(order_params)
  if @order_address.valid?
    pay_item
    @order_address.save
    redirect_to root_path
  else
    render :index
  end
 end

 private

 def item_find
  @item = Item.find(params[:item_id])
    if @item.order.nil?
      if @item.user_id == current_user.id
        render :index
      end
    else
      redirect_to root_path
    end
 end


 def order_params
   params.require(:order_address).permit(:postal_code,:prefecture_id,:city,:house_number,:building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
 end

 def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
   Payjp::Charge.create(
     amount: @item.price,  # 商品の値段
     card: order_params[:token],    # カードトークン
     currency:'jpy' 
   )
 end
end
