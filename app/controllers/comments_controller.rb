class CommentsController < ApplicationController
	before_action :authenticate_person!
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(comment_param)

		if @comment.save
			@comment = @comment.update(user_id: current_user.id)
			flash[:success] = "Comment successfully added!"
			redirect_to article_path(@article)
			
			#or :user => current_user.id
			#remember thet .update updates the attributes and saves the record. 
			#Returns true or nil if saved or not.
		else
			flash[:danger] = @comment.errors.full_messages
			redirect_to article_path(@article)
		end
		
	end



	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])

		if admin_signed_in? || current_user.id == @comment.user_id
			@comment.destroy
			redirect_to article_path( @article )
			flash[:success] = "Comment successfully deleted!" 
		else
			redirect_to article_path ( @article )
			flash[:danger] = "There was an error, you cannot delete that comment."
		end
	end


private
	def comment_param
		params.require(:comment).permit(:name, :body, :user_id)
	end
end
