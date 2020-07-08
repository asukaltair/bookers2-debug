class PostCommentsController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		@comment = @book.post_comments.build(post_comment_params)
		@comment.user_id = current_user.id
		@comment.save
		render :index
	end

	def destroy
		@comment = PostComment.find(params[:id])
		@comment.destroy
		render :index
	end

	private

	def post_comment_params
		params.require(:post_comment).permit(:comment, :user_id, :book_id)
	end

end
