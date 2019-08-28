class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :boxes, dependent: :destroy
  has_many :carts, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  mount_uploader :avatar, PhotoUploader

  def current_cart
    Cart.find_by(user: self, paid: "pending") || Cart.create(user: self, paid: 'pending')
  end

  def current_box
    Box.find_by(user: self, status: "shipping") || Box.create(user: self, status: 'shipping')
  end
end
