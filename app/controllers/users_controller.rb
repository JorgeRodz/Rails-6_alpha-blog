class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # In order to display the user articles
    @articles = @user.articles
  end

  def index
    @users = User.all
  end

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your accoutn information was succesfully updated"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  private #--------------------------------------------------------------------------------------------------

  # Strong Parameters - to validate what is comming from the form and safety save the correc values.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
