class PairTopicsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @pair_topics = current_user.pair_topics
  end

  def show
    @pair_topic = PairTopic.find(params[:id])
    # @json = @pair_topic.to_gmaps4rails do |pair_topic, marker|
    #   marker.infowindow render_to_string(:partial => "/pair_topics/gmaps_marker", :locals => { :object => pair_topic})
    #   marker.picture({
    #                   :picture => "assets/favicon.ico",
    #                   :width   => 32,
    #                   :height  => 32
    #                  })
    #   # marker.title   "i'm the title"
    #   # marker.sidebar "i'm the sidebar"
    #   marker.json({ :id => pair_topic.id, :title => pair_topic.title })
    # end

    @pair_offer = PairOffer.new
    @my_offer = PairOffer.find_by_user_id_and_pair_topic_id(current_user.id, @pair_topic.id)
    @pair_offers = @pair_topic.pair_offers

  end

  def edit
    @pair_topic = PairTopic.find(params[:id])
    authorize! :edit, @pair_topic
  end

  def update
    @pair_topic = PairTopic.find(params[:id])

    respond_to do |format|
      if @pair_topic.update_attributes(params[:pair_topic])
        format.html { redirect_to @pair_topic, notice: 'Pair Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pair_topic.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @pair_topic = PairTopic.new
  end

  def create
    @pair_topic = current_user.pair_topics.build(params[:pair_topic])
    @pair_topic.save
    redirect_to pair_topics_path
  end

  def destroy
    @pair_topic = PairTopic.find(params[:id])
    @pair_topic.destroy
    respond_to do |format|
      format.html { redirect_to pair_topics_url }
      format.json { head :no_content }
    end
  end

end