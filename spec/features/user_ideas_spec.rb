require 'rails_helper'
RSpec.describe "User visits ideas index" do
  scenario "creates a new idea" do
    user = create(:user)
    idea = build(:idea)
    category = create(:category)
    image = create(:image)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_on 'My brainBox'
    click_on 'Create a new idea'
    fill_in("idea[content]", with: idea.content)
    select(category.title, from: "idea[category_id]").select_option

    click_on 'Add idea'
    expect(page).to have_content(idea.content)
    expect(page).to have_content(category.title)
    expect(page).to have_content("Idea saved")

    click_on "Edit"
    fill_in("idea[content]", with: "New idea")
    click_on "Update"

    expect(page).to have_content("New idea")
    click_on 'Delete'
    save_and_open_page
    expect(page).to_not have_content(idea.content)
    expect(page).to have_content("Idea deleted")
  end
end
