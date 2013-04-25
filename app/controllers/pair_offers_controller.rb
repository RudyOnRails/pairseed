class PairOffersController < ApplicationController
  def create
    @pair_topic = PairTopic.find(params[:pair_offer][:pair_topic_id])
    @pair_offer = current_user.pair_offers.build(params[:pair_offer])
    @pair_offer.save
    PairOfferMailer.basic_offer(@pair_offer, @pair_topic).deliver
    flash[:notice] = "Your pair offer has been sent!"
    redirect_to @pair_topic
  end

  
end