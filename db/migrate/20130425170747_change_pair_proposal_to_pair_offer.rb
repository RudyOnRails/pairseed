class ChangePairProposalToPairOffer < ActiveRecord::Migration
  def change
    rename_table :pair_proposals, :pair_offers
  end
end
