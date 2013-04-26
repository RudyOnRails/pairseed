class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :presence => true
  validates :first_name, :last_name, :format => { :with => /^[^0-9`!@#\$%\^&*+_=]+$/ }
  validates :username, :uniqueness => { :case_sensitive => false }
  validates :username, :format => { :with => /^[A-Za-z\d_]+$/ }
  validates :username, :exclusion => { :in => %w(admin superuser pairseed) }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

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