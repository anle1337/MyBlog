class CommentsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_param)

		if @comment.save
			flash[:success] = "Comment successfully added!"
			redirect_to article_path(@article)
		else
			render 'articles/show'
		end
		
	end



	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy

		redirect_to article_path( @article ) 

	end


private
	def comment_param
		params.require(:comment).permit(:name, :body)
	end
end
