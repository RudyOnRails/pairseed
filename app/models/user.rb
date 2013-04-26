class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me
  acts_as_taggable_on :organizations

  has_many :pair_topics
  has_many :pair_places
  has_many :organization_memberships
  has_many :organizations, :through => :organization_memberships
  has_many :organization_pair_topics, :through => :organizations, :source => :member_pair_topics, :uniq => true
  has_many :pair_offers

  def not_a_member?(organization_id)
    !self.organizations.include?(organization_id)
  end

  def has_not_offered_help?(pair_topic_id, user_id)
    !PairOffer.where(:pair_topic_id => pair_topic_id, :user_id => user_id).exists?
  end

  def full_name
    first_name + " " + last_name
  end
end