class PairTopicsController < ApplicationController

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

    @pair_proposal = PairProposal.new
    @my_offer = PairProposal.find_by_user_id_and_pair_topic_id(current_user.id, @pair_topic.id)

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