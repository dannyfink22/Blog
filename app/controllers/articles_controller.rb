class ArticlesController < ApplicationController
	before_filter :require_login, except: [:show]


	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		# You can also pass in params attributes in this way one at a time
		#@article.title = params[:article][:title]
		#@article.body = params[:article][:body]
		@article.save
		redirect_to article_path(@article)
		flash.notice = "Article #{@article.title} has been created"

	end

	def article_params
		params.require(:article).permit(:title, :body, :tag_list, :image_url)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path

		flash.notice = "Article #{@article.title} has been deleted"
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article #{@article.title} has been updated"

		redirect_to articles_path(@article)
	end

end
