class PagesController < ApplicationController

  before_filter :authenticate_user!, :only => [:topic_feed]

  def topic_map
    @topics = Topic.all
    @json = @topics.to_gmaps4rails do |topic, marker|
      marker.infowindow render_to_string(:partial => "/topics/gmaps_marker", :locals => { :object => topic})
      marker.picture({
                      :picture => "assets/favicon.ico",
                      :width   => 32,
                      :height  => 32
                     })
      # marker.title   "i'm the title"
      # marker.sidebar "i'm the sidebar"
      marker.json({ :id => topic.id, :title => topic.title })
    end
  end
  
  def topic_feed
    # @feed_topics = User.first.organization_topics.order('created_at DESC')
    # @feed_topics = Topic.order('created_at ASC')
    @feed_topics = Topic.where("user_id != ?", current_user.id)
  end

  def dashboard

  end
end