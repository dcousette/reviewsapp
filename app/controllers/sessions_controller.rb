class SessionsController < ApplicationController 
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:success] = "Login successful!"
      redirect_to restaurants_path
    else 
      flash[:danger] = "Incorrect Username or Password!"
      render :new 
    end
  end
  
  def destroy
    session[:user_id] = nil 
    redirect_to restaurants_path
  end
end