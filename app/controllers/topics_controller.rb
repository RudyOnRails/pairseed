class TopicsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @current_page = "my_topics"
    @topics = current_user.topics
  end

  def show
    @topic = Topic.find(params[:id])
    @offer = Offer.new
    @my_offer = Offer.find_by_user_id_and_topic_id(current_user.id, @topic.id)
    @offers = @topic.offers

  end

  def edit
    @topic = Topic.find(params[:id])
    authorize! :edit, @topic
  end

  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(params[:topic])
    @topic.save
    redirect_to topics_path
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end

end