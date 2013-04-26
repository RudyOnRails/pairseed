class User < ActiveRecord::Base
  before_validation :downcase_email, :downcase_username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :presence => true
  validates :username, :uniqueness => true
  validates :username, :format => { :with => /^[A-Za-z\d_]+$/ }
  validates :username, :exclusion => { :in => %w(admin superuser pairseed) }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

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

  private

    def downcase_email
      self.email = self.email.downcase if self.email.present?
    end

    def downcase_username
      self.username = self.username.downcase if self.username.present?
    end
end