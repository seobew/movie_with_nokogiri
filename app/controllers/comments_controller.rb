class CommentsController < ApplicationController
  def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.update(user_id: current_user.id)
		@comment.save
		redirect_to @post
  end

	private

	def comment_params
		params.require(:comment).permit(:content, :author)
	end
end
