class Order < ApplicationRecord

  belongs_to :item
  belongs_to :user
  has_one :address

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :province_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :city,        presence: true
  validates :address1,    presence: true
  validates :address2
  validates :phone,       presence: true
  validates :order_id,    presence: true
  
end
