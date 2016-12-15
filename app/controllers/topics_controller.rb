class TopicsController < ApplicationController
  before_action :find_topic, only: [:show]

  def index
    @topics = Topic.all.order('created_at DESC')
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  private
  def find_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description)
  end

end
