class CommentsController < ApplicationController

before_action :require_sign_in
before_action :authorize_user, only: [:destroy]
before_filter :get_commentable


  def create
     @comment = @commentable.comments.new(comment_params)

     if @comment.save
       flash[:notice] = "Comment saved successfully."
       redirect_to :back
     else
       flash[:alert] = "Comment failed to save."
       redirect_to :back
     end
   end

   def destroy
      @post = Post.find(params[:post_id])
      comment = @post.comments.find(params[:id])

      if comment.destroy
        flash[:notice] = "Comment was deleted successfully."
        redirect_to [@post.topic, @post]
      else
        flash[:alert] = "Comment couldn't be deleted. Try again."
        redirect_to [@post.topic, @post]
      end
    end


   private

   def get_commentable
      klass = [Post, Topic].detect { |c| params["#{c.name.underscore}_id"] }
      @commentable = klass.find(params["#{klass.name.underscore}_id"])
   end

   def comment_params
     params.require(:comment).permit(:body)
   end

   def authorize_user
     comment = Comment.find(params[:id])
     unless current_user == comment.user || current_user.admin?
       flash[:alert] = "You do not have permission to delete a comment."
       redirect_to [comment.post.topic, comment.post]
     end
   end


end
