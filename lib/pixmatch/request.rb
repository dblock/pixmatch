require 'uri'
require 'rest_client'

module Pixmatch
	module Request
		# Perform a method
		def method(name)
		  request(:get, "rest", { method: name })
		end
		
		private
		
		def request(method, path, params = {})
		  response = RestClient::Request.new({ 
		    method: method, 
		    url: "#{endpoint}/#{paramify(path, params)}", 
		    user: username,
		    password: password
		   }).execute
		   			
			json = Utils.parse_json(response)
		  Utils.handle_error(json)
			json
		end
		
		def paramify(path, params)
      URI.encode("#{path}/?#{params.map { |k,v| "#{k}=#{v}" }.join('&')}")
    end
    
	end
end
