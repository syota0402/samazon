class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  
  def reviews_new
    review.new
  end
end
