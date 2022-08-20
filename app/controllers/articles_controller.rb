class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params) # 何を新しく保存するか指定
    @article.user_id = current_user.id
    if @article.save # もし保存ができたら
      redirect_to articles_path # 投稿画面に遷移
    else # できなければ
      render :new # newに遷移
    end
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    # logger.debug("article_id:" + params[:article_id])
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to action: 'index'
  end

  private  # ストロングパラメーター（予期しない値を変更されてしまう脆弱性を防ぐ機能）

  def article_params
    params.require(:article).permit(:subject, :body).merge(user_id: current_user.id)
  end
end
