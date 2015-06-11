require "rails_helper"

feature "User Creates Account", type: :feature do
  scenario "a user can be created" do
    visit new_user_path
    
    fill_in "Username", with: "samski"
    fill_in "Password", with: "rules"
    click_on "Create Account"

    expect(page).to have_content("samski")
    # reset_session!
  end
end