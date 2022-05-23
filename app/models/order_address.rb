class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :province_id, :city, :address1, :address2, :phone, :order_id, :user_id, :item_id


  
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :province_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :city,        presence: true
  validates :address1,    presence: true
  validates :address2
  validates :phone,       presence: true
  validates :order_id
  validates :user_id
  validates :item_id

end