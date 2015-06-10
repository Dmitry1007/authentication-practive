require "rails_helper"

feature "User Logs Out Of Account", type: :feature do
  scenario "a registered user can logout" do
    user = User.create(username: "Bobo", password: "bambam")
    
    visit login_path
    
    fill_in "Username", with: user.username
    fill_in "Password", with: "bambam"
    click_button "Login"

    expect(page).to have_content("Bobo")
    
    click_on "Logout"

    expect(page).to_not have_content("Bobo")
  end
end