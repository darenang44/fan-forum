class CommentsController < ApplicationController
  before_action :find_topic, only: [:create, :edit, :update, :destroy]
  before_action :find_comment, only: [:edit, :update, :destroy]

  def create
    # to make a comment we need to first find the topic we want to comment on
    # we can find the topic by looking for the :topic_id which is in the comments schema
    # @topic = Topic.find(params[:topic_id])

    # we are building the comments from the topic and when we create something we need to make sure all the params are there
    @comment = @topic.comments.create(comment_params)

    # then we are assigning the comment's user_id to the current_user.id
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to topic_path(@topic)
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to topic_path(@topic)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to topic_path(@topic)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_topic
    # to make a comment we need to first find the topic we want to comment on
    # we can find the topic by looking for the :topic_id which is in the comments schema
    @topic = Topic.find(params[:topic_id])
  end

  def find_comment
    @comment = @topic.comments.find(params[:id])
  end


end
