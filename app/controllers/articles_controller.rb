class ArticlesController < ApplicationController
  
  # Index
  def index
    @articles = Article.all
  end

  # Show
  def show
    @article =Article.find(params[:id])
  end
  # New
  def new
    @article = Article.new
  end


  # Edit
  def edit
    @article =Article.find(params[:id])
  end

  # Create
  def create 
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # Update
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
