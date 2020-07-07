class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :addresses
  has_many :cart_items

  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :lastname_kana, presence: true
  validates :firstname_kana, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :is_registered, inclusion: {in: [true, false]}
end
