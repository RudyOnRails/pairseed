class OffersController < ApplicationController
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
    @topic = @offer.topic

    redirect_to @topic
  end
end