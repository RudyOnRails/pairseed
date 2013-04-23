class PairProposalMailer < ActionMailer::Base
  default from: "PairSeed"

  def pair_offer(pair_proposal, pair_topic)
    @pair_proposal = pair_proposal
    @pair_topic = pair_topic
    mail(to: 'musiorski@gmail.com', subject: "#{@pair_proposal.user.username} wants to pair!")
  end
end
