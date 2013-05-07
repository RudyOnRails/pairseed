class AddStateToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :state, :string
    Topic.all.each do |topic|
      topic.state = "active"
      topic.save
    end
  end
end
