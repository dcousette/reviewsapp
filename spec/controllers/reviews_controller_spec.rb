require 'rails_helper'

describe ReviewsController do
  describe "POST create" do 
    let(:user) { Fabricate(:user) }
    let(:eats) { Fabricate(:restaurant) }
    before { session[:user_id] = user.id }
    
    context "with valid information" do
      it "sets up a restaurant object" do
        post :create, restaurant_id: eats.id, review: Fabricate.attributes_for(:review, user: user)
        expect(assigns(:restaurant)).to eq(eats)
      end
      
      it "adds a review to the database" do 
        post :create, restaurant_id: eats.id, review: Fabricate.attributes_for(:review, user: user)
        expect(Review.all.count).to eq(1)
      end 
      
      it "flashes a success message" do
        post :create, restaurant_id: eats.id, review: Fabricate.attributes_for(:review, user: user)
        expect(flash[:success]).to eq("Your review has been saved.")
      end
      
      it "redirects to the restaurant page" do
        post :create, restaurant_id: eats.id, review: Fabricate.attributes_for(:review, user: user)
        expect(response).to redirect_to restaurant_path(eats) 
      end
      
      it "does not add a review for a restaurant if the user has already created one" do 
        me = Fabricate(:user, id: 1 )
        yums = Fabricate(:restaurant, id: 1, name: "Yum's")
        review_too = Fabricate(:review, user: me, restaurant: yums)
        post :create, restaurant_id: yums.id, review: { rating: 4, content: "Not bad!", user_id: 1 }
        expect(Review.all.count).to eq(1)
      end
    end
    
    context "with invalid information" do  
      it "does not add a review to the database" do 
        post :create, restaurant_id: eats.id, review: { rating: 1 }
        expect(Review.all.count).to eq(0)
      end
      
      it "redirects to the restaurant page" do 
        post :create, restaurant_id: eats.id, review: { rating: 1 }
        expect(response).to redirect_to restaurant_path(eats)
      end
    end
  end
end