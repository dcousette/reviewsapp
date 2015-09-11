require 'rails_helper'

describe RestaurantsController do
  describe "GET new" do 
    it "renders the new restaurant template" do 
      get :new 
      expect(response).to render_template :new  
    end
    
    it "does not save a restaurant object in the database" do 
      get :new 
      expect(Restaurant.all.count).to eq(0)
    end
  end
  
  describe "POST create" do
    context "with valid information" do 
      it "adds a restaurant to the database" do 
        post :create, restaurant: Fabricate.attributes_for(:restaurant, category_id: 1)
        expect(Restaurant.all.count).to eq(1)
      end
      
      it "redirects to the restaurant index path" do 
        post :create, restaurant: Fabricate.attributes_for(:restaurant, category_id: 1)
        expect(response).to redirect_to restaurants_path
      end
      
      it "displays a success message" do 
        post :create, restaurant: Fabricate.attributes_for(:restaurant, category_id: 1)
        expect(flash[:success]).to eq("Your restaurant has been created!")
      end 
    end
    
    context "with invalid information" do 
      it "does not add a restaurant to the database" do 
        post :create, restaurant: { description: "Truck stop food at its best!" , category_id: 1 }
        expect(Restaurant.all.count).to eq(0)
      end 
      
      it "renders the new template" do 
        post :create, restaurant: { description: "Truck stop food at its best!" , category_id: 1 }
        expect(response).to render_template :new 
      end
    end
  end
  
  describe "GET index" do 
    it "sets up an array of all the restaurants" do 
      mcdonalds = Fabricate(:restaurant)
      burgerking = Fabricate(:restaurant)
      get :index  
      expect(assigns(:restaurants)).to eq([mcdonalds, burgerking])
    end
    
    it "renders the restaurants index path" do 
      get :index   
      expect(response).to render_template :index
    end
  end
  
  describe "GET show" do 
    it "sets up a restaurant object" do 
      cafe = Fabricate(:restaurant)
      get :show, id: cafe.id
      expect(assigns(:restaurant)).to eq(cafe)
    end
    
    it "renders the template for the restaurant object" do 
      cafe = Fabricate(:restaurant)
      get :show, id: cafe.id
      expect(response).to render_template :show 
    end 
  end 
  
  describe "GET edit" do 
    it "sets up a restaurant object" do 
      cafe = Fabricate(:restaurant)
      get :edit, id: cafe.id 
      expect(assigns(:restaurant)).to eq(cafe)
    end
    
    it "renders the edit form" do 
      cafe = Fabricate(:restaurant)
      get :edit, id: cafe.id 
      expect(response).to render_template :edit 
    end 
  end 
  
  describe "PUT update" do
    it "changes the restaurant object attributes" do 
      cafe = Fabricate(:restaurant) 
      put :update, id: cafe.id, restaurant: { name: "The Diner", description: "My Fav Place", category_id: 1 } 
      expect(cafe.reload.name).to eq("The Diner") 
    end
    
    it "redirects to the restaurants template" do 
      cafe = Fabricate(:restaurant) 
      put :update, id: cafe.id, restaurant: { name: "The Diner", description: "My Fav Place", category_id: 1 } 
      expect(response).to redirect_to restaurants_path
    end 
    
    it "renders the edit template when submitting invalid information" do 
      cafe = Fabricate(:restaurant) 
      put :update, id: cafe.id, restaurant: { name: nil, description: "My Fav Place", category_id: 1 } 
      expect(response).to render_template :edit 
    end
    
    it "does not update the restaurant object when submitting invalid information" do 
      cafe = Fabricate(:restaurant, description: "A great restaurant.") 
      put :update, id: cafe.id, restaurant: { name: nil, description: "My Fav Place", category_id: 1 } 
      expect(cafe.reload.description).to eq("A great restaurant.")
    end 
  end
end
