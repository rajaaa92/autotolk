require "autotolk/version"

module Autotolk
  require 'autotolk/engine' if defined?(Rails)

  # bing config
  mattr_accessor :bing_client_id
  @@bing_client_id = nil
  mattr_accessor :bing_client_secret
  @@bing_client_secret = nil
  mattr_accessor :azure_account_key
  @@azure_account_key = nil

end
