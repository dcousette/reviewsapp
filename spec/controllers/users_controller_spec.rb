require 'rails_helper'

describe UsersController do 
  describe "POST create" do 
    context "with valid information" do 
      it "adds a user to the database" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(User.all.count).to eq(1)
      end
      
      it "redirects to the restaurants page" do 
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to restaurants_path
      end
      
      it "set the success message in the flash" do 
        post :create, user: Fabricate.attributes_for(:user)
        expect(flash[:success]).to eq("User created successfully")
      end
    end
    
    context "with invalid information" do 
      it "does not add a user to the database" do 
        post :create, user: Fabricate.attributes_for(:user, password: nil)
        expect(User.all.count).to eq(0)  
      end
      
      it "renders the new user template" do 
        post :create, user: Fabricate.attributes_for(:user, password: nil)
        expect(response).to render_template :new   
      end
    end
  end
  
  describe "GET show" do 
    it "sets up the user" do 
      joe = Fabricate(:user)
      get :show, id: joe.id 
      expect(assigns(:user)).to eq(joe)
    end
    
    it "renders the user show template" do 
      joe = Fabricate(:user)
      get :show, id: joe.id 
      expect(response).to render_template :show
    end
  end 
end 