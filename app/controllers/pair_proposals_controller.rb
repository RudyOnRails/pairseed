class PairProposalsController < ApplicationController
  def create
    @pair_topic = PairTopic.find(params[:pair_proposal][:pair_topic_id])
    @pair_proposal = User.first.pair_proposals.build(params[:pair_proposal])
    @pair_proposal.save
    PairProposalMailer.pair_offer(@pair_proposal, @pair_topic).deliver
    flash[:notice] = "Your pair proposal has been sent!"
    redirect_to @pair_topic
  end

  
end