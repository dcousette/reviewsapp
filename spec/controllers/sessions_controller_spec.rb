require 'rails_helper'

describe SessionsController do 
  describe "POST create" do 
    context "with valid information" do   
      it "places a user in the session" do 
        joe = Fabricate(:user)
        post :create, username: joe.username, password: joe.password
        expect(session[:user_id]).to eq(joe.id)
      end
      
      it "redirects to the home page" do 
        joe = Fabricate(:user)
        post :create, username: joe.username, password: joe.password
        expect(response).to redirect_to restaurants_path
      end
    end
    
    context "with invalid information" do 
      it "does not place a user in the session" do 
        joe = Fabricate(:user)
        post :create, username: joe.username, password: "wrong"
        expect(session[:user_id]).to eq(nil)
      end
      
      it "redirects to the restaurants home page" do 
        joe = Fabricate(:user)
        post :create, username: joe.username, password: joe.password
        expect(response).to redirect_to restaurants_path
      end
    end
  end
  
  describe "DELETE destroy" do
    it "removes the user from the session" do 
      joe = Fabricate(:user)
      session[:user_id] = joe.id
      delete :destroy, id: joe.id
      expect(session[:user_id]).to eq(nil)
    end
    
    it "redirects to the restaurants home page" do 
      joe = Fabricate(:user)
      session[:user_id] = joe.id
      delete :destroy, id: joe.id
      expect(response).to redirect_to restaurants_path
    end
  end
end