class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id # to persist user session
      flash[:notice] = "Logged in succesfully"
      redirect_to user
    else
      flash.now[:alert] = "#{ user ? 'Wrong password' : 'User not found'}"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil # to log ut user session
    flash[:notice] = "Logged out"
    redirect_to root_path
  end

end
