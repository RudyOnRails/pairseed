class MembershipsController < ApplicationController
  def create
    @organization = Organization.find(params[:organization_id])
    Membership.create(:user_id => User.first.id, :organization_id => @organization.id)
    redirect_to organizations_path(@organization.id)
  end
end