class Order < ApplicationRecord

  belongs_to :item
  belongs_to :user
  has_one :address

  validates: user, presence: true
  validates: item, presence: true
  
end
