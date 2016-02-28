class RestaurantsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit]
  before_action :setup_restaurant, only: [:show, :edit, :update]

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
    @review = @restaurant.reviews.build
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path
    else
      render :edit
    end
  end

  private

  def setup_restaurant
    @restaurant = Restaurant.find_by(slug: params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :category_id, :image_url, :image)
  end
end
