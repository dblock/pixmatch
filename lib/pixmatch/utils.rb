require 'hashie'
require 'json'

module Pixmatch
  # @private
  module Utils
    private 
      def self.handle_error(json_response)
        raise Pixmatch::Error.new(json_response) if (json_response['status'] != 'ok')
      end
      
      # Parses JSON and returns a Hashie::Mash
      def self.parse_json(json)
        Hashie::Mash.new(JSON.parse(json))
      end
  end
end
