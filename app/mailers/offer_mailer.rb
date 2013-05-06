class OfferMailer < ActionMailer::Base
  # default from: "PairSeed Offers"

  def basic_offer(offer, topic)
    @offer = offer
    @topic = topic
    @helper = @offer.user
    @from = "\"PairSeed\" <notifications@pairseed.com>"
    mail(:from => @from, to: @topic.user.email, subject: "#{@helper.full_name + " (" + @helper.username + ") "} wants to pair!")
  end
end
