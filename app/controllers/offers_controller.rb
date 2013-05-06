class OffersController < ApplicationController
  def create
    @topic = Topic.find(params[:offer][:topic_id])
    @offer = current_user.offers.build(params[:offer])
    @offer.save
    OfferMailer.basic_offer(@offer, @topic).deliver
    flash[:notice] = "Your offer has been sent!"
    redirect_to @topic
  end

  
end