class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
        @articles = Article.all
    end

    def show
    	@article = Article.find(params[:id])
    end

    def new
    	@article = Article.new
    	flash.notice = "Article '#{@article.title}' Created!"
    end

    def create
    	@article = Article.new(article_params)
        @article.save

        redirect_to article_path(@article)
    end

    def destroy
    	# Uses params[:id] to find the article in the database
     #    Calls .destroy on that object
     #    Redirects to the articles index page
        @article = Article.find(params[:id])
        @article.destroy
        flash.notice = "Article Deleted!"
        redirect_to article_path(@articles)
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
