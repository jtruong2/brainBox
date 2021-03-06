class Category < ApplicationRecord
  validates_presence_of :title
  validates_uniqueness_of :title
  has_many :ideas
end
