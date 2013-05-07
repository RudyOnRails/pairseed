class OffersController < ApplicationController

  before_filter :authenticate_user!

  def create
    @topic = Topic.find(params[:offer][:topic_id])
    @offer = current_user.offers.build(params[:offer])
    @offer.save
    OfferMailer.basic_offer(@offer, @topic).deliver
    flash[:notice] = "Your offer has been sent!"
    redirect_to @topic
  end

  def accept
    @offer = Offer.find(params[:id])
    @offer.accept
    OfferMailer.basic_acceptance(@offer).deliver
    @topic = @offer.topic
    other_offers = @topic.offers.reject {|offer| offer == @offer}
    other_offers.each do |other_offer|
      other_offer.decline
    end
    @topic.accept_offer


    redirect_to @topic
  end
end