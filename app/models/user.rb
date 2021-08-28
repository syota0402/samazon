class User < ApplicationRecord
  has_many :reviews
  extend DisplayList
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  acts_as_liker
  
  scope :search_information, -> (keyword) {
    where("name LIKE :keyword OR id LIKE :keyword OR email LIKE :keyword OR address LIKE :keyword OR postal_code LIKE :keyword OR phone LIKE :keyword", keyword: "%w{keyword}%")
  }
end
