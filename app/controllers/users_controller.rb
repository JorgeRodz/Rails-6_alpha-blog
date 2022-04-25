class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # restrictions
  before_action :require_login_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

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

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user #clean up the session otherwise the session will have the deleted user store
    flash[:notice] = "Account and all the associated articles succesfully deleted"
    redirect_to root_path
  end

  private #--------------------------------------------------------------------------------------------------

  # Strong Parameters - to validate what is comming from the form and safety save the correc values.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own profile"
      redirect_to @user
    end
  end

end
