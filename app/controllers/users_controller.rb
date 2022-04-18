class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    # In order to display the user articles
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # to persist user session
      flash[:notice] = "Welcome #{@user.username} to the Alpha Blog, you have succesfully sign up"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was succesfully updated"
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

  def set_user
    @user = User.find(params[:id])
  end

end
