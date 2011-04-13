module Pixmatch
  class Client
    module List
      # List the contents of the collection.
      def list(offset = 0, limit = 0) 
        response = request(:get, 'rest', { method: 'list', offset: offset, limit: limit })
        result = response['result']
        raise "Missing result in response." if result.nil?
        raise "Invalid result in response (#{result.class.name})." if ! result.is_a?(Array)
        result
      end
    end    
  end
end
