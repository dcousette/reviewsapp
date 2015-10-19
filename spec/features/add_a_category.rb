require 'rails_helper'

feature "Add a category" do 
  scenario "with a valid name" do 
    sign_in
    click_on('Categories')
    click_on('Add a category')
    
    fill_in 'Name', :with => 'Ethnic'
    click_button('Create Category')
    expect(page).to have_content('Your category was created successfully.')
  end
  
  scenario " with a blank name" do
    sign_in
    click_on('Categories')
    click_on('Add a category')
    
    fill_in 'Name', :with => ''
    click_button('Create Category')
    expect(page).to have_content("Name can't be blank")
  end
end