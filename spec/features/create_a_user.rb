require 'rails_helper'

feature "Add a user" do 
  scenario "with a valid username and password" do 
    visit new_user_path
    fill_in( 'Username', :with => 'billyray')
    fill_in( 'Password', :with => 'miley')
    click_on 'Create User'
    
    expect(page).to have_content('User created successfully')
    expect(current_path).to eq(restaurants_path)
  end
  
  scenario "without a valid username and password" do 
    visit new_user_path
    fill_in( 'Username', :with => 'billyray')
    click_on 'Create User'
    expect(page).to have_content("Password can't be blank")
  end
end