class AddDescriptionToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :description, :text, :null => false, :default => ""
  end
end
