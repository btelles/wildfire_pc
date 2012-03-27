class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  protected

  def authenticate

    if %w{production development}.include? Rails.env

      authenticate_or_request_with_http_basic do |username, password|

        username_hash = Digest::SHA1.hexdigest(username)

        password_hash = Digest::SHA1.hexdigest(password)

        # foo, bar
        return username_hash == "0beec7b5ea3f0fdbc95d0dd47f3c5bc275da8a33" && password_hash == "62cdb7020ff920e5aa642c3d4066950dd1f01f4d"
      end
    end
    return true
  end
end
