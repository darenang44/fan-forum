class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all.order('created_at DESC')
  end

  def show
  end

  def new
    #@topic = Topic.new

    @topic = current_user.topics.build
  end

  def create
    # @topic = Topic.new(topic_params)

    @topic = current_user.topics.build(topic_params)

    if @topic.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to root_path
  end


  private
  def find_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description)
  end

end
