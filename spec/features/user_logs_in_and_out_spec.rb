require 'rails_helper'
RSpec.describe "user logs in" do
  context "with valid credentials" do
    scenario "sees user dashboard" do
      user = create(:user)

      visit login_path
      fill_in("session[username]", with: user.username)
      fill_in("session[password]", with: "Mypassword")
      click_on("login", match: :first)
      save_and_open_page
      expect(page).to have_content("Welcome, #{user.username}")
      expect(page).to have_content("Successful login")
      expect(current_path).to eq(user_path(user))

      click_on "logout"

      expect(page).to_not have_content("#{user.username}")
      expect(page).to have_content("You've logged out")
      expect(current_path).to eq(root_path)
    end
  end

  context "with invalid credentials" do
    scenario "redirects to login displaying error invalid credentials" do
      user = create(:user)

      visit login_path
      fill_in("session[username]", with: user.username)
      fill_in("session[password]", with: "fakepassword")
      click_on("login", match: :first)
      

      expect(page).to_not have_content("Welcome, #{user.username}")
      expect(page).to have_content("Failed login attempt, try again")
      expect(current_path).to eq(login_path)
    end
  end
end
