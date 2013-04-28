class PairOfferMailer < ActionMailer::Base
  # default from: "PairSeed Offers"

  def basic_offer(pair_offer, pair_topic)
    @pair_offer = pair_offer
    @pair_topic = pair_topic
    @helper = @pair_offer.user
    mail(:from => "Pair Seed", to: @pair_topic.user.email, subject: "#{@helper.full_name + " (" + @helper.username + ") "} wants to pair!")
  end
end
