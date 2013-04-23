class CreatePairTopics < ActiveRecord::Migration
  def change
    create_table :pair_topics do |t|
      t.string      :title
      t.text        :description
      t.integer     :user_id
      
      t.timestamps
    end
  end
end
