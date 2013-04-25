class PairOfferMailer < ActionMailer::Base
  # default from: "PairSeed Offers"

  def basic_offer(pair_offer, pair_topic)
    @pair_offer = pair_offer
    @pair_topic = pair_topic
    mail(from: "#{@pair_offer.user.first_name + " " + @pair_offer.user.last_name }", to: @pair_topic.user.email, subject: "#{@pair_offer.user.username} wants to pair!")
  end
end
