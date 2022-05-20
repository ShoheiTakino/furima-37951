class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :name,        presence: true
  validates :content,     presence: true
  validates :category_id, presence: true
  validates :status_id,   presence: true
  validates :shipfee_id,  presence: true
  validates :province_id, presence: true
  validates :date_i,      presence: true
  validates :price,       presence: true
  validates :image,       presence: true

end
