class PagesController < ApplicationController

  before_filter :authenticate_user!, :only => [:topic_feed]

  def pair_topic_map
    @pair_topics = PairTopic.all
    @json = @pair_topics.to_gmaps4rails do |pair_topic, marker|
      marker.infowindow render_to_string(:partial => "/pair_topics/gmaps_marker", :locals => { :object => pair_topic})
      marker.picture({
                      :picture => "assets/favicon.ico",
                      :width   => 32,
                      :height  => 32
                     })
      # marker.title   "i'm the title"
      # marker.sidebar "i'm the sidebar"
      marker.json({ :id => pair_topic.id, :title => pair_topic.title })
    end
  end
  
  def topic_feed
    # @feed_topics = User.first.organization_pair_topics.order('created_at DESC')
    @feed_topics = PairTopic.order('created_at ASC')
  end

  def dashboard

  end
end