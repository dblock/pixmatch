# Adapted from the Ruby Twitter gem.
# @see https://github.com/jnunemaker/twitter
module Pixmatch
	# Defines constants and methods related to configuration.
	module Configuration
		# An array of valid keys in the options hash when configuring a {Flixated::API}.
		VALID_OPTIONS_KEYS = [
			:username,
			:password,
			:endpoint
		].freeze
	
		# By default, don't set a username.
		DEFAULT_USERNAME = nil.freeze
		
		# By default, don't set a password.
		DEFAULT_PASSWORD = nil.freeze
		
		# The endpoint that will be used to connect if none is set.
		DEFAULT_ENDPOINT = 'https://api.tineye.com'.freeze
		
		# @private
		attr_accessor(*VALID_OPTIONS_KEYS)
		
		# When this module is extended, set all configuration options to their default values.
		def self.extended(base)
			base.reset
		end
		
		# Convenience method to allow configuration options to be set in a block.
		def configure
			yield self
		end
		
		# Create a hash of options and their values.
		def options
			VALID_OPTIONS_KEYS.inject({}) do |option,key|
				option.merge!(key => send(key))
			end
		end
		
		# Reset all configuration options to default.
		def reset
			self.username               = DEFAULT_USERNAME
			self.password               = DEFAULT_PASSWORD
			self.endpoint               = DEFAULT_ENDPOINT
		end
	end
end
