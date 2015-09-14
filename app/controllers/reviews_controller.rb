class ReviewsController < ApplicationController
  def new 
    @review = Review.new   
  end
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    @review.user_id = 1  #this needs to be changed to current_user.id
    
    if @review.save 
      flash[:success] = "Your review has been saved."
      redirect_to restaurant_path(@restaurant)
    else 
      redirect_to restaurant_path(@restaurant)
    end
  end
  
  private 
  
  def review_params
    params.require(:review).permit(:rating, :content, :restaurant_id)
  end
end
