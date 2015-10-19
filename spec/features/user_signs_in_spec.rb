require 'rails_helper'

feature "Signing in" do 
  given(:user) { Fabricate(:user, username: "joeblow", password: "blowjoe") } 
  
  scenario "with the correct username and password" do
    sign_in(user)
    expect(page).to have_content('Login successful!')
  end 
  
  scenario "with the incorrect username and password" do 
    visit login_path  
    fill_in 'Username', :with => 'joeblow' 
    fill_in 'Password', :with => 'joe'
  
    click_button('Log in')
    expect(page).to have_content('Incorrect Username or Password!')
  end 
end