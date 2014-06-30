class Authentication < ActiveRecord::Base
  VALID_PROVIDERS = ['meetup']

  belongs_to :user

  validates :provider, inclusion: {in: VALID_PROVIDERS}
  validates_presence_of :uid, :provider, :user
  validates_uniqueness_of :uid, :scope => :provider

  def self.create_with_user!(auth_hash)
    authentication = Authentication.new(
      :provider => auth_hash.provider,
      :uid      => auth_hash.uid,
      :token    => auth_hash['credentials']['token'],
      :sectret  => auth_hash['credentials']['secret']
    )
  end
end
