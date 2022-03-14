class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    # We need this instance variable in order to show the errors messages.
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successufully"
      redirect_to @article # Here we redirect to the 'show' action, to see the new article information we add.
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated succesfully"
      redirect_to @article # Here we redirect to the 'show' action, to see the new article information we add.
    else
      render 'edit'
    end
  end

end