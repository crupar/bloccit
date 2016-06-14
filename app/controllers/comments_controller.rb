class CommentsController < ApplicationController

before_action :require_sign_in
before_action :authorize_user, only: [:destroy]


   def create
     commenting(@comment_type)
     comment.user = current_user

     if comment.save
       flash[:notice] = "Comment saved successfully."
       redirect_to [:back]
     else
       flash[:alert] = "Comment failed to save."
       redirect_to [:back]
     end
   end

   def destroy
     commenting(@comment_type)

      if comment.destroy
        flash[:notice] = "Comment was deleted successfully."
        redirect_to [:back]
      else
        flash[:alert] = "Comment couldn't be deleted. Try again."
        redirect_to [:back]
      end
    end


   private

   def comment_params
     params.require(:comment).permit(:body)
   end

   def authorize_user
     comment = Comment.find(params[:id])
     unless current_user == comment.user || current_user.admin?
       flash[:alert] = "You do not have permission to delete a comment."
       redirect_to [:back]
     end
   end

  def commenting (type)
    @post = Post.find(params[:post_id])

    if (@comment_type == "post")
       comment = @post.comments.find(params[:id])
    elsif (@type == "topic")
       comment = @comment_topic.comments.find(params[:id])
    else
        flash[:alert] = "Something isn't working correctly"
    end
  end


end
