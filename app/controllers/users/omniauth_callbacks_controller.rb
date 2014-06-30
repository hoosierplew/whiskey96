class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  class DoubleAuthenticationError < RuntimeError; end

  def all
    provider_credentials = {
      :provider => auth_hash['provider'],
      :uid      => auth_hash['uid'].to_s
    }

    if current_user.present?
      # Whiskey96 will only support a single provider (meetup) to login or
      # create a local account. If in the future we would like to support
      # multiple social login providers, add that logic here.
      raise DoubleAuthenticationError
    else
      authentication = Authentication.where(provider_credentials).first
      authentication ||= Authentication.create_with_user!(auth_hash)

      sign_in_and_redirect authentication.user
    end
  end

  alias_method :meetup, :all

  protected ###################################################################

  def auth_hash
    request.env['omniauth.auth']
  end

end
