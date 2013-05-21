class AddPicToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :pic, :string
  end
end
