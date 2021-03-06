class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :province_id, :city, :address1, :address2, :phone, :user_id, :item_id, :token

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid.' }
  validates :province_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone,       format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }

  with_options presence: true do
    validates :city
    validates :address1
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, province_id: province_id, city: city, address1: address1, address2: address2,
                   phone: phone, order_id: order.id)
  end
end
