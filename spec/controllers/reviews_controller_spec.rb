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
        session[:user_id] = me.id
        yums = Fabricate(:restaurant, id: 1, name: "Yum's")
        yums.reviews << Fabricate(:review, user: me, content: "The only game in town.")
        post :create, restaurant_id: yums.id, review: { rating: 4, content: "Not bad!" }
        expect(yums.reviews.count).to eq(1)
      end
    end
    
    context "with invalid information" do  
      it "does not add a review to the database" do 
        post :create, restaurant_id: eats.id, review: { rating: 1 }
        expect(Review.count).to eq(0)
      end
      
      it "renders the restaurant show template" do 
        post :create, restaurant_id: eats.id, review: { rating: 1 }
        expect(response).to render_template :show 
      end
    end
  end
end