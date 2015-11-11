class ArticlesController < ApplicationController

before_action :authenticate_person!, except: [:index, :show]


	def index
		@articles = Article.all
	end

	def create
		@article = Article.new(article_param)

		if @article.save
			redirect_to @article
			flash[:success] = "Article successfully saved!"
		else
			render 'new'
		end
	end

	def show

		@article = Article.find(params[:id])
		@comment = Comment.new
	end

	def new
		@article = Article.new
	end

	def edit 
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_param)
			redirect_to @article
			flash[:success] = "Article successfully edited!"
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to root_path
	end

private

	def article_param
		params.require(:article).permit(:title, :body)
	end
end
