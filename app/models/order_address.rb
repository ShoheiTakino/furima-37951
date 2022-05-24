class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :province_id, :city, :address1, :address2, :phone, :user_id, :order_id, :item_id


  
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :province_id, presence: true, numericality: {other_than: 0, message: "can't be blank"}
  validates :city,        presence: true
  validates :address1,    presence: true
  validates :phone,       presence: true
  validates :user_id,     presence: true
  validates :item_id,     presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, province_id: province_id, city: city, address1: address1, address2: address2, phone: phone, order_id: order.id)
  end

end