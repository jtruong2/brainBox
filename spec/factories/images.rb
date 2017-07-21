FactoryGirl.define do
  factory :image do
    image_file_name {File.new("#{Rails.root}/public/images/gif/200w_s001.gif")}
    image_content_type 'image/gif'
  end
end
