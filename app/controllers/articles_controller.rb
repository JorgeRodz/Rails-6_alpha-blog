class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    # We need this instance variable in order to show the errors messages.
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
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

  def article_params
    params.require(:article).permit(:title, :description)
  end

end