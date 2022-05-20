class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create 
    @item = Item.new(item_params)
  end

  def edit 

  end

  def update
  end
  
  private
  def item_params
  end



end
