class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params) 
    @review.user_id = current_user.id
    
    if review_exists_already?(@restaurant, current_user)
      flash[:danger] = "You can only write one review"
      render 'restaurants/show'
    elsif @review.save
      flash[:success] = "Your review has been saved."
      redirect_to restaurant_path(@restaurant)
    else 
      render 'restaurants/show'
    end
  end
  
  private 
  
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
