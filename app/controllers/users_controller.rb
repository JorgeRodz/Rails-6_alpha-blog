class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.username} to the Alpha Blog, you have succesfully sign up"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private #--------------------------------------------------------------------------------------------------

  # Strong Parameters - to validate what is comming from the form and safety save the correc values.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
