class ChangePairtypeIdToPairTypeIdInTopics < ActiveRecord::Migration
  def up
    rename_column :topics, :pairtype_id, :pair_type_id
  end

  def down
    rename_column :topics, :pair_type_id, :pairtype_id
  end
end
