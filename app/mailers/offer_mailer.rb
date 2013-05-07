class OfferMailer < ActionMailer::Base
  # default from: "PairSeed Offers"

  def basic_offer(offer, topic)
    @offer = offer
    @topic = topic
    @helper = @offer.user
    @from = "\"PairSeed\" <notifications@pairseed.com>"
    mail(:from => @from, to: @topic.user.email, subject: "#{@helper.full_name + " (" + @helper.username + ") "} wants to pair!")
  end

  def basic_acceptance(offer)
    @offer = offer
    @topic = offer.topic
    @acceptor = offer.topic.user
    @from = "\"PairSeed\" <notifications@pairseed.com>"
    mail(:from => @from, to: @offer.user.email, subject: "#{@acceptor.full_name + " (" + @acceptor.username + ") "} accepted your pair offer!")
  end
end
