require 'rails_helper'

feature "Add a restaurant" do 
  scenario "with valid information" do 
    sign_in
    expect(page).to have_content("Add a restaurant")
    
    click_on('Add a restaurant')
    expect(current_path).to eq(new_restaurant_path)
    
    fill_in( "Name", :with => "Our Place") 
    fill_in( "Description", :with => "A great place to eat")
    fill_in( "Image File Name", :with => "my_image.jpg")
    
    page.select("Fast Food", :from => "restaurant_category_id")
    
    click_on('Create Restaurant')
    
    # assert Your restaurant has been created 
    # assert page is the restaurants index 
    expect(page).to have_content('Your restaurant has been created!')
    expect(current_path).to eq(restaurants_path)
  end 
  
  scenario "with invalid information" 
end 