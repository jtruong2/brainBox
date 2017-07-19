require 'rails_helper'
RSpec.describe "admin logs in" do
  scenario "sees admin dashboard" do
    admin = create(:admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_path
    expect(page).to have_content("Admin's dashboard")
  end
end
