class Idea < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_and_belongs_to_many :images
  validates_presence_of :category_id
end
