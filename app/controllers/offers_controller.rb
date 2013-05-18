class OffersController < ApplicationController

  before_filter :authenticate_user!

  def create
    @topic = Topic.find(params[:offer][:topic_id])
    @offer = current_user.offers.build(params[:offer])
    @offer.save
    @topic.offer_help
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
    @topic.schedule
    Appointment.create(:offer_id => @offer.id, :place => @offer.suggested_place, :date_and_time => @offer.suggested_datetime, :helper_id => @offer.user.id, :helpee_id => @topic.user.id, :topic_id => @topic.id)


    redirect_to @topic
  end
end