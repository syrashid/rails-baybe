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
end
