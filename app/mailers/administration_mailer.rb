class AdministrationMailer < ActionMailer::Base
  # default from: "PairSeed Offers"

  def notify_onboarding_about_new_user(user)
    @user = user
    @from = "\"PairSeed Admin\" <notifications@pairseed.com>"
    @onboarding = "kevin@pairseed.com"
    mail(:from => @from, to: @onboarding, subject: "#{@user.full_name} (#{@user.username}) signed up!")
  end

end
