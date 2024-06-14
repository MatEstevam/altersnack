class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email" }
  validates :address, presence: true

  has_one_attached :photo
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy

end
