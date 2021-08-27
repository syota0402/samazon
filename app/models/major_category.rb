class MajorCategory < ApplicationRecord
  has_mant :categories
  extend DisplayList
end
