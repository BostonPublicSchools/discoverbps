# frozen_string_literal: true

class User < ApplicationRecord
  has_many :students, -> { order(:first_name) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, omniauth_providers: %i[facebook twitter]

  # Setup accessible (or protected) attributes for your model
  # TODO: remove since rails 5 no longer support, but kept for testing
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name
  # attr_accessible :title, :body

  validates_uniqueness_of :email,	case_sensitive: false, allow_blank: true, if: :email_changed?
  validates_format_of :email,	with: Devise.email_regexp, allow_blank: true, if: :email_changed?
  validates_presence_of :password,	on: :create
  validates_confirmation_of :password,	on: :create
  validates_length_of :password,	within: Devise.password_length, allow_blank: true

  def self.find_or_create_from_oauth(auth, _signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user.blank?
      user = User.create!(name: auth.extra.raw_info.name,
                          provider: auth.provider,
                          uid: auth.uid,
                          email: auth.info.email,
                          password: Devise.friendly_token[0, 20])
    end
    user
  end
end
