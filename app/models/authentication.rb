class Authentication < ActiveRecord::Base
  VALID_PROVIDERS = ['meetup']

  belongs_to :user

  validates :provider, inclusion: {in: VALID_PROVIDERS}
  validates_presence_of :uid, :provider, :user
  validates_uniqueness_of :uid, :scope => :provider

  # Remove if we wanted to support multiple social logins for the same provider
  validates_uniqueness_of :provider, :scope => :user_id

  def self.create_with_user!(auth_hash)
    Authentication.new.tap do |authentication|
      authentication.provider = auth_hash.provider
      authentication.uid      = auth_hash.uid
      authentication.token    = auth_hash['credentials']['token']
      authentication.secret   = auth_hash['credentials']['secret']

      authentication.build_user(
        :name           => auth_hash.info.name,
        :service_avatar => open(auth_hash.info.photo_url)
      )

      authentication.save!
    end
  end
end
