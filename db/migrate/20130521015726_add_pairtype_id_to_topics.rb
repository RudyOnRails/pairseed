class AddPairtypeIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :pairtype_id, :integer
  end
end
