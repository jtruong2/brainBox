require 'rails_helper'
RSpec.describe "User visits ideas index" do
  scenario "creates a new idea" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_on 'Create a new idea'
    fill_in("idea[content]", with: "Hello, World!")
    
  end
end
