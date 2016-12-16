class CommentsController < ApplicationController

  def create
    # to make a comment we need to first find the topic we want to comment on
    # we can find the topic by looking for the :topic_id which is in the comments schema
    @topic = Topic.find(params[:topic_id])

    # we are building the comments from the topic and when we create something we need to make sure all the params are there
    @comment = @topic.comments.create(comment_params)

    # then we are assigning the comment's user_id to the current_user.id
    @comment.user_id = current_user.user_id

    if @comment.save
      redirect_to topic_path(@topic)
    else
      render 'new'
    end
    
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
