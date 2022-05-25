class OrdersController < ApplicationController
  before_action :move_to_index
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end



  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      #pay_item
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private 


  def order_params
    params.require(:order_address).permit(:postal_code, :province_id, :city, :address1, :address2, :phone, :user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && @item.user_id == current_user.id
      redirect_to root_path
    end

    if @item.order.present?
      redirect_to root_path
    end
  end

  #def pay_item
    #Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    #Payjp::Charge.create(
       # card: order_params[:token],
     #)
  #end
end
