FactoryGirl.define do
  factory :category do
    sequence :title do |i|
      "Technology#{i}"
    end
  end
end
