require 'uri'
require 'rest_client'

module Pixmatch
	module Request		
		private
		
		def request(http_method, path, query_params = {}, data_params = {})
		  capture RestClient::Request.new({ 
		    method: http_method,
		    url: "#{endpoint}/#{paramify(path, query_params)}", 
		    user: username,
		    password: password
		   }.merge(data_params)).execute   			
		end
		
		def capture(response)
			json = Utils.parse_json(response)
		  Utils.handle_error(json)
			json
		end
		
		def paramify(path, params)
      URI.encode("#{path}/?#{params.map { |k,v| "#{k}=#{v}" }.join('&')}")
    end
    
	end
end
