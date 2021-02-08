class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_item, only: [:index, :create]

  def index
    @order = Buy.new
  end  

  def create
    @order = Buy.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private

  def order_params
    params.require(:buy).permit(:postal_code,:prefecture_id,:municipality,:address,:building,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end  

  def set_item
    @item = Item.find(params[:item_id])
  end   
end
