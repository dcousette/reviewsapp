class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params) 
    @review.user_id = current_user.id
    
    if @restaurant.review_exists_already?(current_user)
      flash[:danger] = "You can only write one review"
      redirect_to restaurant_path(@restaurant)
    elsif @review.save
      flash[:success] = "Your review has been saved."
      redirect_to restaurant_path(@restaurant)
    else 
      redirect_to restaurant_path(@restaurant)
    end
  end
  
  private 
  
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
