require 'rails_helper'
RSpec.describe "Admin visits dashboard" do
  scenario "adds and deletes an image" do
    admin = create(:user, role:1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_index_path
    click_on "Add a new image"
    attach_file("image_image", File.join(Rails.root, "public/images/gif/200w_s001.gif"))
    click_on "Upload"

    expect(page).to have_selector("img")
  end

end
