class ArticlesController < ApplicationController
    before_action :authenticate_user!
    def create
        @article = Article.new(article_params) # 何を新しく保存するか指定
        if @article.save # もし保存ができたら
            redirect_to new_article_path  # 投稿画面に遷移
        else  # できなければ
            @articles = Article.all
            render :new  # newに遷移
        end
    end
    
    def new
        @article = Article.new
        @articles = Article.all
    end

    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
        redirect_to request.referer
        else
        render :new
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to request.referer
    end
    
    private  # ストロングパラメーター（予期しない値を変更されてしまう脆弱性を防ぐ機能）
    def article_params
        params.require(:article).permit(:subject, :body) 
    end


end
