class Item < ApplicationRecord
  with_options presence:true do
    validates :product_name
    validates :explanation
    validates :selling_price,  numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :fee_id
    validates :prefecture_id
    validates :day_id
  end

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :state

end
