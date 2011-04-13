require File.expand_path('../request', __FILE__)

# Adapted from the Ruby Twitter gem.
# @see https://github.com/jnunemaker/twitter
module Pixmatch
	# @private
	class API
		# @private
		attr_accessor(*Configuration::VALID_OPTIONS_KEYS)
		
		# Creates a new API
		def initialize(options = {})
			options = Pixmatch.options.merge(options)
			Configuration::VALID_OPTIONS_KEYS.each do |key|
				send("#{key}=", options[key])
			end
		end
		
		include Request
	end
end
