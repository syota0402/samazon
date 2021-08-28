class MajorCategory < ApplicationRecord
  has_many :categories
  extend DisplayList
  scope :major_category_names_and_id, -> { all.pluck(:name, :id) }
end
