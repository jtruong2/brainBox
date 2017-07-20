require 'rails_helper'
RSpec.describe "User registers for an account" do
  context "with unique username" do
    scenario "creates a new user profile" do
      user = build(:user)

      visit '/'
      click_on 'sign up'
      fill_in('user_username', with: user.username)
      fill_in('user_password',  with: user.password)
      click_on 'sign up'

      expect(page).to have_content("Welcome, #{user.username}")
      expect(page).to have_content("Account created")
    end
  end

  context "with non unique username" do
    scenario "does not create profile, prompts to try again" do
      user1 = create(:user)
      user2 = build(:user)


      visit '/'
      click_on 'sign up'
      fill_in('user_username', with: user2.username)
      fill_in('user_password',  with: user2.password)
      click_on 'sign up'

      expect(page).to_not have_content("Welcome, #{user2.username}")
      expect(page).to_not have_content("Successfully signed in")
      expect(page).to have_content("Invalid entry, try again")
      expect(current_path).to eq(new_user_path)
    end
  end

end
