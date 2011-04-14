require File.expand_path('../pixmatch/version', __FILE__)
require File.expand_path('../pixmatch/configuration', __FILE__)
require File.expand_path('../pixmatch/utils', __FILE__)
require File.expand_path('../pixmatch/error', __FILE__)
require File.expand_path('../pixmatch/api', __FILE__)
require File.expand_path('../pixmatch/client', __FILE__)

# Adapted from the Ruby Twitter gem.
# @see https://github.com/jnunemaker/twitter
module Pixmatch
  extend Configuration
  
  # Alias for pixmatch::Client.new
  #
  # @return {pixmatch::Client}
  def self.client(options = {})
    Pixmatch::Client.new(options)
  end
  
  # Delegate to pixmatch::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end
  
  # Delegate to pixmatch::Client
  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
end
