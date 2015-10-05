class RestaurantsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit]
  
  def index 
    @restaurants = Restaurant.all     
  end
  
  def new
    @restaurant = Restaurant.new 
  end
  
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save 
      flash[:success] = "Your restaurant has been created!"
      redirect_to restaurants_path
    else 
      render :new 
    end
  end
  
  def show 
    @restaurant = Restaurant.find(params[:id])
    @review = @restaurant.reviews.build
  end 
  
  def edit 
    @restaurant = Restaurant.find(params[:id])
  end 
  
  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    
    if @restaurant.save 
      redirect_to restaurants_path
    else 
      render :edit
    end
  end 
  
  private 
  
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :category_id, :image_url)
  end
end