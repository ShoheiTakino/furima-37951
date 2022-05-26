class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new, :create, :show]
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all.order('created_at DESC')
    @order = Order.all
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
    @item = Item.find(params[:id])
  end

  def edit
    if current_user.id == @item.user.id
    else
      redirect_to root_path
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to action: :show
    else
      @item = item
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user.id
      item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :status_id, :status_id, :shipfee_id, :province_id,
                                 :shipping_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?

    @item = Item.find(params[:id])
    redirect_to root_path if @item.order.present?
  end
end
