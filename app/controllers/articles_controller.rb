class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    #make the new artcile record
    puts 'Creating Article'
    @article = Article.create(article_params)
    #redirect the user
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

private

  def article_params
     # using strong params to only permit the attributes (fields) that we explicitly allow
     # returns a filtered params (hash) has with ONLY the attributes we allow through
     params.require(:article).permit(:title, :body)
  end
end