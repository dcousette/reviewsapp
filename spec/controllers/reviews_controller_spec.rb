require 'rails_helper'

describe ReviewsController do
  describe "POST create" do 
    context "with valid information" do
      it "sets up a restaurant object" do
        eats = Fabricate(:restaurant)
        post :create, restaurant_id: eats.id, review: Fabricate.attributes_for(:review)
        expect(assigns(:restaurant)).to eq(eats)
      end
      
      it "adds a review to the database" do 
        eats = Fabricate(:restaurant)
        post :create, restaurant_id: eats.id, review: Fabricate.attributes_for(:review)
        expect(Review.all.count).to eq(1)
      end 
      
      it "flashes a success message" do 
        eats = Fabricate(:restaurant)
        post :create, restaurant_id: eats.id, review: Fabricate.attributes_for(:review)
        expect(flash[:success]).to eq("Your review has been saved.")
      end
      
      it "redirects to the restaurant page" do 
        eats = Fabricate(:restaurant)
        post :create, restaurant_id: eats.id, review: Fabricate.attributes_for(:review)
        expect(response).to redirect_to restaurant_path(eats) 
      end
    end
    
    context "with invalid information" do  
      it "does not add a review to the database" do 
        eats = Fabricate(:restaurant)
        post :create, restaurant_id: eats.id, review: { rating: 1 }
        expect(Review.all.count).to eq(0)
      end
      
      it "redirects to the restaurant page" do 
        eats = Fabricate(:restaurant)
        post :create, restaurant_id: eats.id, review: { rating: 1 }
        expect(response).to redirect_to restaurant_path(eats)
      end
    end
  end
end