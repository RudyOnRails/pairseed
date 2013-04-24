class RemoveDescriptionFromPairTopics < ActiveRecord::Migration
  def change
    remove_column :pair_topics, :description
  end
end
