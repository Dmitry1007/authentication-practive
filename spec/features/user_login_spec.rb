require "rails_helper"

feature "User Logs In To Account", type: :feature do
  scenario "a registered user can login" do
    user = User.create(username: "Bobo", password: "bambam")
    
    visit login_path
    
    fill_in "Username", with: user.username
    fill_in "Password", with: "bambam"
    click_on "Login"

    expect(page).to have_content("Bobo")
    # reset_session!
  end

  # test for what happens if the user doesn't exist?
  # test what happens if user doesn't have correct password?
end