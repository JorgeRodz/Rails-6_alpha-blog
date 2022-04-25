class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  # restrictions
  before_action :require_login_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destory]

  def show
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    # We need this instance variable in order to show the errors messages.
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user # To assign the new article to the user who is logged in
    if @article.save
      flash[:notice] = "Article was created successufully"
      redirect_to @article # Here we redirect to the 'show' action, to see the new article information we add.
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated succesfully"
      redirect_to @article # Here we redirect to the 'show' action, to see the new article information we add.
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path # This means we are redirecting to the articles index, showing all the articles we have.
  end

  private #--------------------------------------------------------------------------------------------------

  # We call this method before :show, :edit, :update, destroy
  def set_article
    @article = Article.find(params[:id])
  end

  # Strong Parameters - to validate what is comming from the form and safety save the correc values.
  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit and delete article's of your own"
      redirect_to @article
    end
  end

end