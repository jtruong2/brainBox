require 'rails_helper'
RSpec.describe "admin logs in" do
  scenario "sees admin dashboard" do
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_index_path
    expect(page).to have_content("Admin's Dashboard")
  end

  context "with valid title" do
    scenario "creates a category" do
      admin = create(:user, role: 1)
      category = build(:category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_index_path
      click_on "Create a new category"
      fill_in("category[title]", with: category.title)
      click_on "Submit"

      expect(page).to have_content(category.title)
      expect(page).to have_content("Category added")
      expect(current_path).to eq(admin_dashboard_index_path)
    end
  end

  scenario "deletes a category" do
    admin = create(:user, role: 1)
    category1 = create(:category)
    category2 = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_index_path
    click_on("delete", match: :first)


    expect(page).to_not have_content(category1.title)
    expect(page).to have_content(category2.title)
  end
end
