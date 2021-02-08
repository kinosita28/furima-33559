class Buy
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code,:prefecture_id,:municipality,:address,:building,:phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with:/\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :municipality, format: {with:/\A[一-龥ぁ-ん]/}
    validates :address
    validates :phone_number, format: {with:/\A\d{11}\z/}
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Domicile.create(postal_code: postal_code,prefecture_id: prefecture_id,municipality: municipality,address: address,building: building,phone_number: phone_number,order_id: order.id)
  end  
end  