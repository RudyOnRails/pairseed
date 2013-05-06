class FewNameChanges < ActiveRecord::Migration
  def change
    rename_table :organization_memberships, :memberships
    rename_table :pair_offers, :offers
    rename_column :offers, :pair_topic_id, :topic_id
    rename_column :offers, :pair_place, :suggested_place
    rename_table :pair_places, :places
    rename_table :pair_topics, :topics
  end
end
