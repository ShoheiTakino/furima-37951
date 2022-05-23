class Address < ApplicationRecord

  belongs_to :order

  validates :postal_code,   presence: true
  validates :province_id,   presence: true
  validates :city,          presence: true
  validates :address1,      presence: true
  validates :address2,
  validates :phone,         presence: true

end
