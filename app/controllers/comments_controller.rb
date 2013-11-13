class CommentsController < ApplicationController

  def create
   @post = Post.find(params[:post_id])
#  @comment = Comment.new(params.require(:comment).permit(:body))
#  @comment.post = @post
   @comment = @post.comments.build(params.require(:comment).permit(:body))
   @comment.creator = User.first

   if @comment.save
      flash[:notice] = 'Your comment is added.'
      redirect_to post_path(@post)
   else
      render 'posts/show'
   end
  end
end
