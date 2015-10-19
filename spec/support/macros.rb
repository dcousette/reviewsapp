def sign_in(a_user= nil)
  user = a_user || Fabricate(:user)
  visit login_path
  fill_in 'Username', :with => user.username 
  fill_in 'Password', :with => user.password 
  click_button('Log in')
end
