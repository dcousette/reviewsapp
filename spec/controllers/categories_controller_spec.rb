require 'rails_helper'

describe CategoriesController do
  describe "GET index" do 
    it "sets an array of all the categories" do 
      fast_food = Fabricate(:category, name: "Fast Food")
      fine_dining = Fabricate(:category, name: "Fine Dining")
      get :index
      expect(assigns(:categories)).to eq([fast_food, fine_dining])
    end 
    
    it "renders the categories index template" do 
      fast_food = Fabricate(:category, name: "Fast Food")
      fine_dining = Fabricate(:category, name: "Fine Dining")
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe "GET show" do 
    it "sets up a category object" do 
      fast_food = Fabricate(:category, name: "Fast Food")
      get :show, id: fast_food.id
      expect(assigns(:category)).to eq(fast_food)
    end
    
    it "renders the template for the category" do 
      fast_food = Fabricate(:category, name: "Fast Food")
      get :show, id: fast_food.id
      expect(response).to render_template :show 
    end 
  end
  
  describe "POST create" do 
    context "with valid data" do
      it "adds a category to the database" do 
        post :create, category: Fabricate.attributes_for(:category)
        expect(Category.all.count).to eq(1)
      end
      
      it "redirects to the categories page" do 
        post :create, category: Fabricate.attributes_for(:category)
        expect(response).to redirect_to categories_path
      end
      
      it "displays a success message" do 
        post :create, category: Fabricate.attributes_for(:category)
        expect(flash[:success]).to eq("Your category was created successfully.")
      end 
    end
    
    context "with invalid data" do 
      it "does not add a category to the database" do 
        post :create, category: Fabricate.attributes_for(:category, name: nil)
        expect(Category.all.count).to eq(0)
      end 
      
      it "renders the new category template" do 
        post :create, category: Fabricate.attributes_for(:category, name: nil)
        expect(response).to render_template :new   
      end 
    end
  end
end
