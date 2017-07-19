FactoryGirl.define do
  factory :user do
    username "Genericusername"
    password "Mypassword"
  end

  factory :admin do
    username "Adminuser"
    password "Mypassword"
    role 1
  end
end
