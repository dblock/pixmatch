# Adapted from the Ruby Twitter gem.
# @see https://github.com/jnunemaker/twitter
module Pixmatch
  # Wrapper for the Pixmatch REST API
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each { |f| require f }
    
    include Pixmatch::Client::Ping
    include Pixmatch::Client::Count
    include Pixmatch::Client::Add
    include Pixmatch::Client::List
    include Pixmatch::Client::Delete
    include Pixmatch::Client::Search
  end
end
