class Address < ApplicationRecord
  belongs_to :customer
  validates :name, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
end
