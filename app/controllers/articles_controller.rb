class ArticlesController < ApplicationController

  def show
    @article = Article.find_by(id: params[:id])

    @time = @article.time
	  @count_articles = current_user.article_times.count
	  @article_times = sprintf("%.2f",((@count_articles).to_f / @time) * 100)
	  @article_time_graph = 100 - (@article_times).to_f
  end

  def index
    @article = Article.find_by(id: params[:id])
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

  def destroy
    @article.destroy
    redirect_to root_path
  end


  def article_params
    params.require(:article).permit(:name,:time)
  end
end
