class ChangeAcitveTopicStateToUnoffered < ActiveRecord::Migration
  def up
    active_topics = Topic.where(:state => "active")
    active_topics.each do |active_topic|
      active_topic.update_attribute(:state, "unoffered")
    end
  end

  def down
    unoffered_topics = Topic.where(:state => "unoffered")
    unoffered_topics.each do |unoffered_topic|
      unoffered_topic.update_attribute(:state, "active")
    end
  end
end
