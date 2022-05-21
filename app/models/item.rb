class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipfee, :province, :date

  belongs_to :user
  has_one_attached :image

  validates :name,        presence: true
  validates :content,     presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :status_id,   presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipfee_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :province_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price,       presence: true, numericality: { only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to:9999999},
                          presence: { message: "can't be blank"}


  validates :image,       presence: true

end
