class Image < ApplicationRecord
  has_attached_file :image, styles: {small: "64x64", med: "100x100", large: "200x200"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
  has_and_belongs_to_many :ideas
end
