

class ArticlesController < ApplicationController
    include ArticlesHelper
    
   before_filter :require_login, except: [:show, :index, :most]
  
    def index
     @articles = Article.all
     
    end
    
   
    def most
     @articles = Article.all 
     @articles = @articles.sort {|x,y| y.views <=> x.views}
     @articles = @articles[0..2]
    end    
    
    def show
     @article = Article.find(params[:id])
     @article.view
     @comment = Comment.new
     @comment.article_id = @article.id
    end    
    
    def new
       
      @article = Article.new
       
    end    
    
    def create
         @article = Article.new(
         title: params[:article][:title],
         body: params[:article][:body],
         )
         @article.set_view_count
         @article.save
         flash.notice = "Article '#{@article.title}' Created!"
         redirect_to article_path(@article)

    end 
    
    def destroy
    
        @article = Article.find(params[:id])
        @article.destroy
        flash.notice = "Article '#{@article.title}' Deleted!"
        redirect_to articles_path
       
    end   
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
     @article = Article.find(params[:id])
     @article.update(article_params)
     flash.notice = "Article '#{@article.title}' Updated!"
     redirect_to article_path(@article)
    end

end
