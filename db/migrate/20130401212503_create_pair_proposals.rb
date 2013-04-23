class CreatePairProposals < ActiveRecord::Migration
  def change
    create_table :pair_proposals do |t|
      t.belongs_to :pair_topic, index: true
      t.belongs_to :user, index: true
      t.datetime :suggested_datetime
      t.text :message

      t.timestamps
    end
  end
end
