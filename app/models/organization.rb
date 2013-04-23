class Organization < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  attr_accessible :name, :description, :url, :logo_image
  has_many :organization_memberships
  has_many :members, :through => :organization_memberships, :source => :user
  has_many :member_pair_topics, :through => :members, :source => :pair_topics

  mount_uploader :logo_image, LogoImageUploader
end
