class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
	  #@article_times = @article.article_times
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to article_path(@article)
  end

  def article_params
    params.require(:article).permit(:name)
  end
end
