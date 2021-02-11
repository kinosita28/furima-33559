class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
  end  

  def create
    @order = Buy.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private

  def order_params
    params.require(:buy).permit(:postal_code,:prefecture_id,:municipality,:address,:building,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end  

  def set_item
    @item = Item.find(params[:item_id])
  end   

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.selling_price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end  

  def move_to_index
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    else
      @order = Buy.new
    end  
  end  

end
