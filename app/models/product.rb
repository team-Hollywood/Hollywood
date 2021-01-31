class Product < ApplicationRecord
  attachment :image
  has_many :cart_items
  has_many :ordered_items
  belongs_to :genre

  validates :is_valid, inclusion: {in: [true, false]}
  validates :discription, presence: true
  validates :name, presence: true
  validates :image, presence: true
  validates :tax_excluded_price, numericality: { only_integer:true }
end
