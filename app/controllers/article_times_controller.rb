class ArticleTimesController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @time = @article.time
    @article_times = current_user.article_times.where(article_id: @article.id)
    @count_articles = @article_times.count

    #達成回数を増やす部分
    article_time = @article.article_times.new(user_id: current_user.id)
    article_time.save

    #+1なのはcreate実行時点では達成日数が反映されていないため
    if @count_articles + 1 == @time
      #100%達成の動き
      #実績テーブルに格納
      Achievement.create(
      user_id: current_user.id,
      article_id: @article.id,
      name: @article.name,
      start_time: @article.created_at,
      time: @time
    )
      #実績に情報を映したのでタスクを削除する
      @article_times.destroy_all
      @article.destroy
      redirect_to congratulation_article_article_times_path
    else
      #未達成ならそのページにとどまる
      redirect_to article_path(@article)
    end
  end
end
