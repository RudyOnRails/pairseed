module ApplicationHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end

  OFFERS = {
    'accepted' => 'success',
    'declined' => 'error'
  }

  def offer_tr_class(offer)
    OFFERS[offer.state]
  end
end
