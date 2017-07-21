class Idea < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates_presence_of :category_id
end
